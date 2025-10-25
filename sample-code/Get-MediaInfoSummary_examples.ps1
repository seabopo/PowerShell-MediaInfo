#==================================================================================================================
#==================================================================================================================
# Sample Code :: Get MediaInfo Summary Information
#==================================================================================================================
#==================================================================================================================

#==================================================================================================================
# Initialize Test Environment
#==================================================================================================================

# Load the standard test initialization file.
. $(Join-Path -Path $PSScriptRoot -ChildPath '_init-test-environment.ps1')

# Override the Default Debug Logging Setting
#   $env:PS_STATUSMESSAGE_SHOW_VERBOSE_MESSAGES = $true

#==================================================================================================================
# Run Tests
#==================================================================================================================

    $path = Join-Path -Path $mediaPath -ChildPath 'TVEpisodes'
    Get-ChildItem -LiteralPath $( $path ) -Recurse |
    Where-Object { -not $_.PSIsContainer -and $_.Extension -in ('.mp4','.m4v','.mov') } |
    Sort-Object -Property 'FullName' |
    ForEach-Object {

        $r = Get-MediaInfoSummary -File $($_)
        if ( $r.success ) {
            # Write-Msg -a -o $r.value
            Write-Msg -a -ps -m "File: $($_)"
            Write-Msg -a -m "Resolution: $($r.value.video.FormatTag)"
            Write-Msg -a -m "Aspect: $($r.value.video.AspectRatioTag)"
            Write-Msg -a -m "Source: $($r.value.SourceTag)"
            Write-Msg -a -m "Profile: $($r.value.video.ProfileTag)"
            Write-Msg -a -m "Audio: $($r.value.audio.FormatTag)"

            # Write-Msg -a -m "Settings: $($r.value.video.EncodingSettings)"
            # Write-Msg -a -m "iTunes: $($r.value.iTunes)"
            # Write-Msg -a -m "DrmProtected: $($r.value.DrmProtected)"
            # Write-Msg -a -m "ColorSpace: $($r.value.video.ColorSpace)"
            # Write-Msg -a -m "EncodedBy: $($r.value.EncodedBy)"
            # Write-Msg -a -m "Encoder: $($r.value.Video.Encoder)"
            # Write-Msg -a -m "Codec: $($r.value.CodecID)"
            # Write-Msg -a -m "AudioCodec: $($r.value.audio.Codec)"
            # Write-Msg -a -m "Encoded: $($r.value.Video.EncodedDate)"
            # Write-Msg -a -m "Tagged: $($r.value.Video.TaggedDate)"
            # Write-Msg -a -m "Source: $($r.value.Video.TransferSource)"
            # Write-Msg -a -m "FormatProfile: $($r.value.FormatProfile)"

        }
        else { Write-Msg -e -il 2 -m $r.message }
        
    }