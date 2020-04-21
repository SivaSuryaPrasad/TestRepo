#Drive Letter Changing
echo "Test ChangeDrive"
Get-WmiObject -Class Win32_volume -Filter 'DriveType=5' | Select-Object -First 1 | Set-WmiInstance -Arguments @{DriveLetter='U:'}
$DriveLetters = (Get-WmiObject -Class Win32_volume -Filter 'DriveType=3').DriveLetter

foreach($DriveLetter in $DriveLetters)
{
    if($DriveLetter -eq "E:")
	{
        Get-Partition -DriveLetter $DriveLetter.Trim(":") | Set-Partition -NewDriveLetter F
    }
}

