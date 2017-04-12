###
## Movvent - move tagged file to their place
##
##
###
PARAM(
[string] $Label = "",
[string] $Path = ""
)
#Functions

#Headers
$scriptpath = Split-Path -Path ($myInvocation.invocationname) -parent
$scriptname = Split-Path -Path ($myInvocation.invocationname) -leaf

# Modules
Import-module ./libs/logging.psm1

$LogFile = InitLog $scriptpath $scriptname

$DefaultPath="C:\Users\Student\Desktop\Letoltes"
$Labels = @{
  "Film"="C:\Users\Student\Desktop\Filmek"
  "Mese"="C:\Users\Student\Desktop\Mese"
}

#Body
#region:Body
WriteLog "Elindult" 0

foreach ($f in $labels.Keys) {
  $LocalPath=$Labels.Item($f) 
  if (!(Test-Path -Path $LocalPath))
  {
    WriteLog "Mappa létrehozása: $f -> $LocalPath"  
    Write-Host "${f}: $($LocalPath)"
    # Linux user :) New-Item "$LocalPath" -type directory
  }
}
if ($Label -And $Path) 
{
  WriteLog "Paraméterek: címke: $Label; forrás: $Path"
}
else
{
  WriteLog "Nincsenek minden paraméter megadva! címke: $Label; forrás mappa: $Path. A program leáll."
  exit
}

$DestinationPath = $Labels.$Label
WriteLog "Fájlok mozgatásának előkészítése: forrás: $Path; cél $DestinationPath"
if (Test-Path -Path $Path)
{
  WriteLog "A forrás mappa ($Path) létezik"
  $JoinDestinatinFolder = Join-Path -Path  $destinationFolder -Childpath (Split-path -path $Path -leaf)
  if (!(Test-Path -Path $JoindestinationFolder))
  {
    WriteLog "Fájlok mozgatása: forrás: $Path; cél $DestinationPath"
    Move-Item -Path $Path -Destination $joindestinationPath -PassThru
  }
}
else
{
  WriteLog "A forrás mappa ($Path) nem létezik! A program leáll."
  exit
}

#region:Body

#Footer

#Restart-Service -Name *allshare*
