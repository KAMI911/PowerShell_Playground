###
##K
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

$labels = @{
  "Film"="C:\Users\Student\Desktop\Flmek"
  "Mese"="C:\Users\Student\Desktop\Mese"
  #HF mappák léterhozása
}
#Body
#region:Body
WriteLog "Elindult" 0
WriteLog "Paraméterek:"
if ($Label) 
{
  WriteLog "Címke: $Label"
  WriteLog "P: $labels.$Label"
  $Path="$labels.$Label"
}
if ($Path) {WriteLog "Path: $Path"}

if($Label)
{
  $destinationFolder = $labels.$label
  if (Test-Path -Path $Path)
  {
    $joinDestinatinFolder = Join-Path -Path  $destinationFolder -Childpath (Split-path -path $Path -leaf)
    if (!(Test-Path -Path $joindestinationFolder))
    {
      Move-Item -Path $Path -Destination $joindestinationPath -PassThru
    }
  }
}

#region:Body

#Footer

#Restart-Service -Name *allshare*
