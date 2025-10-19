function Show-MissingBinaryMessage {
    <#
    .DESCRIPTION
        Displays a message to the user to explaining the module's binary requirements.

    .OUTPUTS
        None.

    .EXAMPLE
        Show-MissingBinaryMessage
    #>
    [OutputType([Void])]
    [CmdletBinding()]
    param ( )

    process {

        try {

            Write-Msg -p -ps -m 'Alerting the user about the module binary requirements ...'

            $msg = @(

                'This PowerShell module requires the MediaInfo CLI application to be installed.','',

                'MediaInfo is a cross-platform solution to display information about audio and video files.',
                'This tool is an open-source project licensed under a BSD-style license and',
                'is available for free on https://mediaarea.net/ ( https://mediaarea.net/en/MediaInfo/License ).','',

                'On MacOS, the MediaInfo binary can be installed using Homebrew with the',
                'following command: $ brew install media-info','',

                'On Windows, the MediaInfo binary can be installed using Chocolatey with the',
                'following command: $ choco install mediainfo-cli','',

                'Users of all operating systems can download the latest binary versions from the',
                'project site: https://mediaarea.net/en/MediaInfo/Download','',

                'Source code can be downloaded from Github: https://github.com/MediaArea/MediaInfo','',

                'Please note that this module is only tested against MediaInfo release version',
                $('"{0}"' -f $MEDIAINFO_VERSION),'',

                'For additional information see https://github.com/seabopo/PowerShell-MediaInfo',''

            ) -join [System.Environment]::NewLine

            Write-Msg -a -m $msg

        }
        catch {
            $errMsg = "An error occurred while attempting to inform the user of the module's installation requirements."
            Write-Msg -x -m $( "{0} `r`n" -f $errMsg ) -o $_
        }

    }

}
