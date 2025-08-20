$before_path = ($pwd).Path
cd Desktop
cls
$file = "__"
while(($file -eq "__end")-eq $false){
    $host.UI.RawUI.ForegroundColor = "Yellow"
    write-host "输入文件名： " -NoNewLine
    $host.UI.RawUI.ForegroundColor = "White"
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
    write-host "`n调试结束。"

    $host.UI.RawUI.ForegroundColor = "White"
}
pause
# $host.UI.RawUI.ForegroundColor = "White"
cd $before_path
cls

cls
