Function Get-HintedVideoSource {
    <#
    .DESCRIPTION
        Estimates the video source based on the encoding properties.
    
    .OUTPUTS
        [String].

    .PARAMETER VideoProperties
        REQUIRED. Float. Alias: -p. PSCustomObject of Video Encoding properties.

    .EXAMPLE
        Get-HintedVideoSource -p @{}
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [Alias('p')] [PSCustomObject] $MpegProperties
    )

    process {

        Write-Msg -FunctionCall -IncludeParameters

        $source = $(
            if     ( ($MpegProperties.iTunes) -and ($MpegProperties.DrmProtected) ) { 'IT+' }
            elseif ( ($MpegProperties.iTunes)                                     ) { 'IT'  }
            elseif ( ($MpegProperties.Video.ColorSpace) -eq 'BT.601 NTSC'         ) { 'OTA' }
            elseif ( ($MpegProperties.EncodedBy)        -like "HandBrake *"       ) { 'DSC' }
            elseif ( ($MpegProperties.EncodedBy)        -like "Lavf*"             ) { 'SC'  }
            elseif ( ($MpegProperties.Audio.codec)      -eq 'ec-3'                ) { 'SC'  }
            else                                                                    { 'DSC' }
        )

        if ( $source -eq 'DSC' -and [Int]$MpegProperties.video.FrameWidth -ge 900 ) { $source = 'BR' }
        if ( $source -eq 'DSC' -and [Int]$MpegProperties.video.FrameWidth -lt 900 ) { $source = 'DVD' }

        Write-Msg -FunctionResult -o $source

        return  $source

    }
}
