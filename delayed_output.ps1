# PowerShell script to delay the output of text using Write-Host and Start-Sleep

# Define an array of messages
$messages = @(
    "This is the first message.",
    "This is the second message.",
    "This is the third message."
)

# Set the delay interval in seconds
$delayInterval = 2

# Loop through the array and output each message with a delay
foreach ($message in $messages) {
    Write-Host $message
    Start-Sleep -Seconds $delayInterval
}

