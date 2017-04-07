<# 
 .Synopsis
  Write a new entry a logfile and to the terminal.

 .Description
  General logging method that writes a level based, color coded message
  to a logfile and to the terminal. 

 .Parameter message
  Message to log.

 .Parameter level
  Level message.
#>
# Loging module

# WriteLog
# Writes a file and terminal message with a selected level
# string: Logging message
# int: Logging level

function WriteLog
{
  PARAM(
    [string] $message = "",
    [int] $level
  )
    $datetime = get-date -format("yyyy-MM-dd HH:mm:ss")
    switch ($level)
    {
      0 {$leveltext = "[INF]"; $color="green"; break}
      1 {$leveltext = "[WAR]"; $color="yellow"; break}
      2 {$leveltext = "[ERR]"; $color="red"; break}
      default {$leveltext = "[INF]"; $color="green"; break}
    }
    $finalMessage = "$datetime $leveltext $message"
    Write-Host $finalMessage -ForegroundColor $color
    Add-Content -Value $finaMessage -Path $$LogFiles
}

function InitLog
{
  PARAM(
    [string] $path = "",
    [string] $name = ""
  )
    $LogFile = Join-Path -Path $path ("$name" -replace ".ps1", ".log")    
    if (!(Test-path -path $logfile))
    {
      New-Item -ItemType File -Path $logfile -Force
    }
   return $LogFile
}
export-modulemember -function WriteLog
export-modulemember -function InitLog

