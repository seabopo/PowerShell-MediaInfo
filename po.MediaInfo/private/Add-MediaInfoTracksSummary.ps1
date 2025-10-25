Function Add-MediaInfoTracksSummary {
    <#
    .DESCRIPTION
        Adds a summary of the data provided by the MediaInfo track data.
    
    .OUTPUTS
        None. Updates the existing PSCustomObject instance.

    .PARAMETER MPEGdata
        REQUIRED. MPEGdata. Alias: -d. An PSCustomObject that contains a 'track' property populated 
        with MediaInfo data.

    .EXAMPLE
        Add-MediaInfoTracksSummary -MPEGdata $d
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,ValueFromPipeline)] [Alias('d')] [PSCustomObject] $MPEGdata
    )

    process {

        Write-Msg -FunctionCall -IncludeParameters
        
        $m = $MPEGdata

        $tu = '* psy_rd=0.40:0.00 * aq=1:0.60*'

        $m.DrmProtected = $false
        $m.Features     = [String[]] @()
        $m.Video        = @{ Encoders = @() }
        $m.Audio        = @{ Encoders = @() }
        $m.Art          = @{ }
        $m.Chapters     = [PSCustomObject[]] @()

        foreach ( $t in $m.tracks ) {
            switch -Wildcard ( $t.'@type' ) {
                'general'   {
                              $m.Duration        = $t.duration
                              $m.DurationString  = $t.Duration_String3
                              $m.BitRate         = $t.OverallBitRate
                              $m.BitRateString   = $t.OverallBitRate_String
                              $m.BitRateMode     = $t.OverallBitRate_Mode
                              $m.EncodedBy       = $t.Encoded_Application
                              $m.CodecID         = $t.CodecID
                              $m.FormatProfile   = $t.format_profile
                              $m.Languages       = @($t.Audio_Language_List -split ' / ' | Sort-Object -Unique)
                              $m.iTunes          = ($null -ne $t.extra.Flavour)
                            }
                'video'     {
                              if ( $t.Format_Commercial -ne 'JPEG' ) {
                                    $m.Features               += $t.Format_Commercial
                                    $m.DrmProtected            = $t.CodecID.StartsWith('drmi')
                                    $m.Video.Codec             = $t.Format
                                    $m.Video.CodecID           = $t.CodecID
                                    $m.Video.ColorSpace        = $t.colour_primaries
                                    $m.Video.Profile           = $s.format_profile
                                    $m.Video.Level             = $s.format_level
                                    $m.Video.FrameWidth        = $t.Width
                                    $m.Video.FrameHeight       = $t.Height
                                    $m.Video.FrameRate         = $t.FrameRate
                                    $m.Video.FrameRateMode     = $t.FrameRate_Mode
                                    $m.Video.AspectRatio       = $t.DisplayAspectRatio
                                    $m.Video.AspectRatioString = $t.DisplayAspectRatio_String
                                    $m.Video.EncodedBy         = $t.Encoded_Library_Name
                                    $m.Video.EncodingSettings  = $t.Encoded_Library_Settings
                                    $m.Video.Tuning            = ($m.Video.EncodingSettings -like $tu ? 'animation' : 'film')
                                    $m.Video.Encoder           = $t.Title
                                    $m.Video.EncodedDate       = $t.Encoded_Date
                                    $m.Video.AspectRatioTag    = ($m.Video.AspectRatio -lt 1.5)  ? 'FS' : `
                                                                 (($m.Video.AspectRatio -lt 1.9) ? 'WS' : 'CWS')
                                    $m.Video.ProfileTag        = Get-HintedVideoProfile -p $m.Video
                                    $m.Video.FormatTag         = Get-VideoFormatName -a $([float]$m.Video.AspectRatio) `
                                                                                     -w $([int]$m.Video.FrameWidth) `
                                                                                     -h $([int]$m.Video.FrameHeight)
                              }
                            }
                'audio'     {
                              if ( $null -eq $m.Audio.Format -or $m.Audio.Format -like '*AAC*' ) {
                                  $m.Features               += $t.Format_Commercial
                                  $m.Audio.Codec             = $t.codecID
                                  $m.Audio.Format            = $t.Format_String
                                  $m.Audio.FormatTag         = ($m.Audio.Codec -like '*ac-3*')  ? 'DD'  : `
                                                               (($m.Audio.Codec -like '*ec-3*') ? 'DD+' : 'DS')
                                  $m.Audio.FormatName        = $t.Format_Commercial
                                  $m.Audio.Channels          = $t.channels
                                  $m.Audio.BitRateString     = $t.BitRate_String
                                  $m.Audio.SampleRateString  = $t.SamplingRate_String
                                }
                            }
                'image'     {
                              $m.Features       += 'coverArt'
                              $m.Art.Format      = $t.Format
                              $m.Art.Width       = [int]$t.Width
                              $m.Art.Height      = [int]$t.Height
                              if ( $m.Art.Width -gt 0 -and $m.Art.Height -gt 0 ) {
                                $m.Art.Ratio       = [math]::Round(([int]$m.Art.Width / [int]$m.Art.Height),2)
                                $m.Art.Orientation = ([math]::Abs($m.Art.Ratio - 1.0) -le 0.02) ? `
                                                     'Square' : ( $m.Art.Width -gt $m.Art.Height ? 'wide' : 'tall' )
                              }
                            }
                'text'      {
                              if ( $t.format -eq 'EIA-608' ) {
                                $m.Features += $('closedCaptions({0})' -f $t.Language_String)
                              }
                              else {
                                $m.Features += $('subtitles({0})' -f $t.Language_String)
                              }
                            }
                'menu'      {
                              $m.Features += 'chapters'
                              $t.extra | Get-Member -MemberType NoteProperty | 
                                    ForEach-Object { 
                                        if ( $_.Name.StartsWith('_') ) {
                                            $m.chapters += @{
                                                ID    = $m.chapters.count
                                                Title = $t.extra."$($_.Name)"
                                                Start = $($_.Name.TrimStart('_')).Replace('_',':')
                                            }
                                        }
                                    }
                            }
            }
        }

        $m.SourceTag = Get-HintedVideoSource -p $m

        $m.features = $m.features | Sort-Object -Unique

    }
}
