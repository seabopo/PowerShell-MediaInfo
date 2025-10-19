function Get-MediaInfoSummary {
    <#
    .DESCRIPTION
        Gets the MediaInfo stream analyzer data and creates a summary.

    .OUTPUTS
        A PSCustomObject containing the stream information and the summary data.

    .PARAMETER File
        REQUIRED. String. Alias: -f. The fully-qualified file path of an MPEG file.

    .EXAMPLE
        Get-MediaInfoSummary -FilePath 'C:\myfile.mp4'

    .EXAMPLE
        Get-MediaInfoSummary -f 'C:\myfile.mp4'
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

                $miResults = $r.value | ConvertFrom-Json

                [PSCustomObject] $mpegData = @{}

                if ( Test-IsSomething($miResults.media.track) ) {
                    $mpegData.Tracks = $miResults.media.track
                    $mpegData | Add-MediaInfoTracksSummary
                }

                $result = @{ success = $true; value = $( $mpegData ) }
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
