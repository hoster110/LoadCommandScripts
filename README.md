# LoadCommandScripts
自动化下插件式命令脚本：提供思路与demo，欢迎拍砖


======================================

zh
注autotest.sh不需要改动，只需要自己一直添加类似与run_start.sh这样的脚本就行，这里run_start.sh、run_stop.sh都是举例
还可以添加更多的run_xx.sh

在使用的时候 只需要链式执行
  1）./autotest.sh stop start xx等；
  2）还可以在链式执行中对应的命令添加参数：./autotest.sh start [param...] stop xx [param...]

特别适合使用在自动构建，自动化测试中，实现了插件式扩展（只需要持续新增run_xx.sh脚本）

======================================

en：
Note that autotest.sh doesn't need to be changed, just keep adding scripts like run_start.sh, where run_start.sh and run_stop.sh are examples
You can also add more run_x.sh
You only need to do chain execution when you use it
1)./autotest.sh stop start xx, etc.
2) parameters can also be added to the corresponding commands in the chain execution:./autotest.sh start [param...]Stop xx/param...
Particularly useful for automated builds, automated tests, and plug-in extensions (just keep adding run_x.sh scripts)

