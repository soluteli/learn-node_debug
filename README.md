## node-debug
Vscode 调试 Javascript 的各种调试。

## legacy 协议
- 源码目录： `./legacy/demo.js`   
- vscode 调试任务名称： `just legacy Demo`
*Tips: 该命令使用了低版本调试协议，高版本 node 可能无法正常运行*

## inspector 协议
- 源码目录： `./inspector/demo.js`   
- vscode 调试任务名称： `vsocode inspector Demo`

## vscode 基本调试
- 源码目录： `./vscode/01-sample.js`   
- vscode 调试任务名称： `vscode sample`

## vscocde 调试添加命令参数
- 源码目录： `./vscode/02-args.js`   
- vscode 调试任务名称： `vscode args`

## vscocde 调试添加环境变量
- 源码目录： `./vscode/03-env.js`   
- vscode 调试任务名称： `vscode env`

## vscocde 调试指定工作路径
- 源码目录： `./vscode/04-cwd.js`   
- vscode 调试任务名称： `vscode cwd`

## vscocde 调试当前打开的文件
- 源码目录： `./vscode/04-cwd.js`   
- vscode 调试任务名称： `vscode cwd`

## vscode 调试 nodemon 程序
- 源码目录： `./nodemon/04-cwd.js`   
- vscode 调试任务名称： `vscode nodemon`

## vscode 调试 npm 启动的任务
- 源码目录： `./npm/app.js`
- npm 脚本：`"debug": "node --inspect=9929 npm/app.js"`
- vscode 调试任务名称： `vscode NPM`

操作步骤：
1. 执行 `npm run debug`
2. 执行对应的 vscode 调试任务

## vscode 实时调试 babel + es6
- 源码目录：`./es6`
- es6 实时变编译任务：`"build:es6": "babel ./es6/src -s -w -d ./es6/dist/"`
- vscode 调试任务名称：`es6:nodemon`

按照上面的步骤，即可在 `./es6/src` 断点调试

## vscode 实时调试 babel + es6
- 源码目录：`./coffee`
- es6 实时变编译任务：`"build:es6": "babel ./es6/src -s -w -d ./es6/dist/"`
- vscode 调试任务名称：`es6:nodemon`

## vscode 调试远程调试
1. 执行本地脚本构建 docker image: `sh docker_build.sh` 
2. 从 image 中创建 container 并运行内置 node 程序：`sh docker_run.sh`
3. 执行 vscode 调试任务：`Docker: Attach to Node`

