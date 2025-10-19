function Read-MediaInfoFileProperties {
    <#
    .DESCRIPTION
        Returns the MediaInfo analytics data for a file.

    .OUTPUTS
        A PSCustomObject containing the audio and video information information.

    .PARAMETER File
        REQUIRED. String. Alias: -f. The fully-qualified file path of an MPEG file.

    .EXAMPLE
        Read-MediaInfoFileProperties -FilePath 'C:\myfile.mp4'

    .EXAMPLE
        Read-MediaInfoFileProperties -f 'C:\myfile.mp4'
    #>
    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)] [Alias('f')] [String] $File
    )

    process {

        try {

            Write-Msg -FunctionCall -IncludeParameters

            $r = Invoke-MediaInfoCommand -File $File
            if ( $r.success ) {
                $result = @{ success = $true; value = $( $r.value | ConvertFrom-JSON ) }
            }
            else {
                $result = $r
            }
            
        }
        catch {
            Write-Msg -x -o $_
            $r = @{ success = $false; message = $_.Exception.Message; value = $null }
        }

        Write-Msg -FunctionResult -o $result

        return $result

    }

}
