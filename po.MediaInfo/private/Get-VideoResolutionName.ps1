Function Get-VideoResolutionName {
    <#
    .DESCRIPTION
        Gets the standardized video format name (4k, 1080p, 480p, etc.).
    
    .OUTPUTS
        [String].

    .PARAMETER AspectRatio
        REQUIRED. Float. Alias: -a. The aspect ratio of the video in numeric format. Example: 1.33

    .PARAMETER FrameWidth
        REQUIRED. Int. Alias: -w. The frame width of the video. Example: 1920

    .PARAMETER FrameHeight
        REQUIRED. Int. Alias: -h. The frame width of the video. Example: 1080

    .EXAMPLE
        Get-VideoResolutionName -a 1.33 -w 1440 -h 1080
    #>
    [OutputType([String])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)] [Alias('a')] [Float] $AspectRatio,
        [Parameter(Mandatory)] [Alias('w')] [Int]   $FrameWidth,
        [Parameter(Mandatory)] [Alias('h')] [Int]   $FrameHeight
    )

    process {

        Write-Msg -FunctionCall -IncludeParameters

        if ( $AspectRatio -lt 1.5 ) {
            $r = switch ( [convert]::ToInt32($FrameWidth) ) {
                    { $_ -gt 2200 -and $_ -le 3400 } {    "4K"; break } # 2872
                    { $_ -gt 1200 -and $_ -le 1600 } { "1080p"; break } # 1440
                    { $_ -gt  800 -and $_ -le 1100 } {  "720p"; break } #  960
                    { $_ -gt  700 -and $_ -le  800 } {  "560p"; break } #  744
                    { $_ -gt  600 -and $_ -le  700 } {  "480p"; break } #  640
                    { $_ -gt  300 -and $_ -le  400 } {  "240p"; break } #  320
                 }
        } else {
            $r = switch ( [convert]::ToInt32($FrameWidth) ) {
                    { $_ -gt 2100 -and $_ -le 4200 } {    "4K"; break } # 4096
                    { $_ -gt 1700 -and $_ -le 2100 } { "1080p"; break } # 1920
                    { $_ -gt 1100 -and $_ -le 1400 } {  "720p"; break } # 1280
                    { $_ -gt  880 -and $_ -le 1000 } {  "560p"; break } #  996
                    { $_ -gt  500 -and $_ -le  880 } {  "480p"; break } #  854 (Anamorphic)
                    { $_ -gt  200 -and $_ -le  500 } {  "240p"; break } #  320
                 }
        }

        Write-Msg -FunctionResult -o $r

        return $r

    }
}
