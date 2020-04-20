#Drive Letter Changing
Install-WindowsFeature -name Web-Server -IncludeManagementTools

#Get-WmiObject -Class Win32_volume -Filter 'DriveType=5' | Select-Object -First 1 | Set-WmiInstance -Arguments @{DriveLetter='U:'}
$DriveLetters = (Get-WmiObject -Class Win32_volume -Filter 'DriveType=3').DriveLetter
$Newdriveletter= "G"
foreach($DriveLetter in $DriveLetters)
{
    if($DriveLetter -eq "F:")
	{
        Get-Partition -DriveLetter $DriveLetter.Trim(":") | Set-Partition -NewDriveLetter $Newdriveletter
    }
}

