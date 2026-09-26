function Invoke-MediaInfoCommand {
    <#
    .DESCRIPTION
        Executes an MediaInfo command against a file and returns the results.

    .OUTPUTS
        A PSCustomObject RESULT object with the following properties:
          - Success : Boolean indicating success or failure.
          - Value   : A string array of console line results.
          - Message : The Error/Exception Message, if one occurred.

    .PARAMETER File
        REQUIRED. String. Alias: -f. The fully-qualified file path of an MPEG file.

    .PARAMETER Command
        REQUIRED. String. Alias: -c. The command line that MediaInfo should execute. 
        The default value is: --Full --Output=JSON FileName

    .EXAMPLE
        Invoke-MediaInfoCommand -File 'C:\myfile.mp4' -Command '--Full --Output=JSON'
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,ValueFromPipeline)] [Alias('f')] [String] $File,
        [Parameter()]                            [Alias('c')] [String] $Command
    )

    process {

        Write-Msg -FunctionCall -IncludeParameters
    
        if ( $SCRIPT:MEDIAINFO_INSTALLED ) {

            if ( [String]::IsNullOrEmpty($Command) ) {
                $Command = '--Full --Output=JSON'
            }
            $cmd = $( "mediainfo {0} `"{1}`"" -f $Command, $File )

            if ( Test-Path -LiteralPath $File -ErrorAction Ignore ) {

                Write-Msg -d -il 1 -m $( 'File Exists: {0}' -f $File )

                [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
                $r = Invoke-Cmd -c $cmd -r 0 -x

                Write-Msg -d -m 'Command Result: ' -il 1 -o $r
                
                if ( $r.success ) {
                    $result = @{ success = $true; value = $( $r.value ) }
                }
                else {
                    $result = @{ success = $false; message = $r.message }
                }
                
            }
            else {
                $result = @{ success = $false; message = $('The specified file was not found: {0}' -f $File) }
            }
            
        }
        else {
            $result = @{ success = $false; message = 'MediaInfo data cannot be read. MediaInfo was not found.' }
        }

        Write-Msg -FunctionResult -o $result

        return $result

    }
}
