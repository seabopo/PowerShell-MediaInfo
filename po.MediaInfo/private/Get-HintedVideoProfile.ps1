Function Get-HintedVideoProfile {
    <#
    .DESCRIPTION
        Estimates the video source profile on the encoding properties.
    
    .OUTPUTS
        [String].

    .PARAMETER MpegProperties
        REQUIRED. Float. Alias: -p. PSCustomObject of Video Encoding properties.

    .EXAMPLE
        Get-HintedVideoProfile -p @{}
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [Alias('p')] [PSCustomObject] $MpegProperties
    )

    process {

        Write-Msg -FunctionCall -IncludeParameters

        $es = $($MpegProperties.Profile + ' / ' + $MpegProperties.EncodingSettings)

        $encodingProfile  = switch -Wildcard ( $es ) {
                                '* cabac=0 * bframes=0 * vbv_maxrate=768 * vbv_bufsize=2000 *' { 'IPOD'; break }
                                '* cabac=1 * ref=1 * vbv_maxrate=20000 * vbv_bufsize=25000 *'  { 'NQ';   break }
                                '* cabac=1 * ref=3 * deblock=1:0:0 * vbv_maxrate=62500 *'      { 'HQ';   break }
                                '* ref=4 * bframes=5 * vbv_bufsize=31250 *'                    { 'SHQ';  break }
                                '* ref=3 * bframes=3 * vbv_bufsize=31250 *'                    { 'ATV3'; break }
                                '* cabac=1 * ref=3 * me=umh * subme=10 *'                      { 'ATV2'; break }
                                '* cabac=1 * brdo=0 * mbaff=0 *'                               { 'AU';   break }
                                '* cabac=0 * ref=1 * mbaff=0 * bframes=0 *'                    { 'AU';   break }
                                '* cabac=0 * ref=2 * bframes=0 *'                              { 'AU';   break }
                                '* vbv_maxrate=5500 *'                                         { 'ATV1'; break }
                                '* vbv_maxrate=9500 *'                                         { 'ATV1'; break }
                                '* vbv_maxrate=14000 *'                                        { 'ATV1'; break }
                                '* cabac=1 * subme=10 * vbv_maxrate=17500 *'                   { 'ATV1'; break }
                                '* cabac=0 * ref=4 * bframes=0 *'                              { 'ATV1'; break }
                                '* rc=2pass * ratetol=1.0 *'                                   { 'CBR';  break }
                                default { 
                                    ([convert]::ToInt32($MpegProperties.FrameWidth) -gt 900) ? 'HD' : 'SD'; break 
                                }
                            }

        $crf = $([regex]::Match($MpegProperties.EncodingSettings,'(?<=\bcrf=)[0-9]+(?:\.[0-9]+)?').Value)
        if (Test-Is($crf)) { $crf = $crf.ToString().Split('.')[0] } else { $crf = $null }
        
        $cbr = $([regex]::Match($MpegProperties.EncodingSettings,'(?<=\bbitrate=)[0-9]+(?:\.[0-9]+)?').Value)
        if (Test-Is($cbr)) { $cbr = $cbr.ToString().substring(0,$cbr.Length -3) } else { $cbr = $null }
        
        $encodingProfile += $crf ?? $cbr
        
        if ( $MpegProperties.Tuning -eq 'animation') { 
            $encodingProfile += '-A'
        }

        Write-Msg -FunctionResult -o $encodingProfile

        return  $encodingProfile

    }
}
