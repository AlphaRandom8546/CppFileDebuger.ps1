$config = Get-Content -Raw -Path ".\config.json"
$configObject = $config | ConvertFrom-Json

$isReg = $configObject.IsReg
$useCnt = $configObject.Cnt
if($isReg -eq "Yes"){$configObject.IsReg = "No"}
if(-not($useCnt -eq 0)){$configObject.Cnt = 0}

$configStr = ConvertTo-Json -Depth 10 $configObject
Set-Content -Path ".\config.json" -Value $configStr