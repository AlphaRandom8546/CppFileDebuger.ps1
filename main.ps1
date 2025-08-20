$config = Get-Content -Raw -Path ".\config.json"
$configObject = $config | ConvertFrom-Json

$isReg = $configObject.IsReg
if($isReg -eq "No"){
    $host.UI.RawUI.ForegroundColor = "Yellow"
    write-host "检测到您还未登录，请先登录，然后再次运行本程序"
    write-host "输入 register 以登录：" -NoNewLine
    while(-not($in -eq "register")){
        $host.UI.RawUI.ForegroundColor = "Gray"
        $in = read-host
        if (-not($in -eq "register")){
            $host.UI.RawUI.ForegroundColor = "Yellow"
            write-host "输入错误，请重新输入：" -NoNewLine
        }
        elseif ($in -eq "register") {break}
    }
    $host.UI.RawUI.ForegroundColor = "Yellow"
    write-host "验证成功！请重新运行本程序"
    $configObject.IsReg = "Yes"
}

$configStr = ConvertTo-Json -Depth 10 $configObject
Set-Content -Path ".\config.json" -Value $configStr

$host.UI.RawUI.ForegroundColor = "Gray"

if($isReg -eq "Yes"){
    $before_path = ($pwd).Path
    cd Desktop
    cls
    $file = "__"
    while(($file -eq "__end")-eq $false){
        $host.UI.RawUI.ForegroundColor = "Yellow"
        write-host "输入文件名： " -NoNewLine
        $host.UI.RawUI.ForegroundColor = "Gray"
        $file = read-host
        $file_path = ($pwd).Path
        if (($file -eq "__end")-or($file -eq "__cls")) {break}
        else {clang++ "$file.cpp"}

        $host.UI.RawUI.ForegroundColor = "Yellow"
        write-host "正在调试：" -NoNewLine
        $host.UI.RawUI.ForegroundColor = "DarkGreen"
        write-host "$file_path\$file.cpp"
        $host.UI.RawUI.ForegroundColor = "Green"
        .\a
        $host.UI.RawUI.ForegroundColor = "Yellow"
        $host.UI.RawUI.BackgroundColor = "Black"
        $useCnt = $configObject.Cnt
        if ($useCnt -eq 0){$useCnt++}
        write-host "`n调试结束，本次为第 $useCnt 次使用此程序。"
        $useCnt++

        $host.UI.RawUI.ForegroundColor = "Gray"
    }
    pause
    cd $before_path
    cls
    cls

    $configObject.Cnt = $useCnt
    $configStr = ConvertTo-Json -Depth 10 $configObject
    Set-Content -Path ".\config.json" -Value $configStr
}
