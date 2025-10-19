function Test-MediaInfoInstalled {
    <#
    .DESCRIPTION
        Determines if the MediaInfo binary is installed and available in the system path.

    .OUTPUTS
        Boolean. True if the MediaInfo binary is installed and available in the system path, otherwise false.

    .EXAMPLE
        Test-MediaInfoInstalled
    #>
    [OutputType([Bool])]
    [CmdletBinding()]
    param ( )

    process {

        try {

            Write-Msg -FunctionCall

            $test = Invoke-Cmd -c $( 'MediaInfo -version' ) -r 0 -f -s
            if ( $test.Success ) {
                Write-Msg -d -il 1 -m $( 'MediaInfo found. Test successful.' )
                $Script:MEDIAINFO_INSTALLED = $true
            }
            else {
                Write-Msg -d -il 1 -m $( 'MediaInfo NOT found. Test failed.' )
                Write-Msg -d -il 2 -m $( $test.message )
            }

        }
        catch {
            $errMsg = 'An error occurred while attempting to validate that the MediaInfo binary is installed.'
            Write-Msg -x -m $( "{0} `r`n" -f $errMsg ) -o $_
        }

        Write-Msg -FunctionResult -m $( 'MediaInfo Found: {0}' -f ($Script:MEDIAINFO_INSTALLED) )

        return $Script:MEDIAINFO_INSTALLED

    }
}
