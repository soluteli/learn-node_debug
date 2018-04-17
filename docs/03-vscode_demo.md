# JavaScript 调试  —— vscode 调试实例
本篇文章主要介绍一些 vscode 调试 JavaScript 的具体实践。
## 调试当前打开的文件
```json
"launch": {
    "version": "0.2.0",
    "configurations": [{
        "type": "node",
        "request": "launch",
        "name": "Launch Program",
        "program": "${file}"
    }]
}
```
为了能够方便地调试 JS 文件，我们可以在 `launch.json` 添加一个如上配置。   
将默认调试任务更改为该配置后，点击开始调试按钮或者 按F5就可以直接调试 vscode 当前打开的 JS 文件。

## 调试 remote 进程
vscode 可以作为工具来调试运行中的Node进程（该进程需要以调试模式启动）。
基本的配置如下：
```js
{
  "type": "node",
  "request": "attach",
  "name": "Docker: Attach to Node",
  "port": 9929,
  "address": "127.0.0.1",
  "localRoot": "${workspaceFolder}/attach",
  "remoteRoot": "/home/app",
  "protocol": "inspector"
}
```
**配置的要点**：
1. `request` 设为 `attach`
2. `address`、`port` 设为 `node` 进程的地址和调试端口
3. `protocol` 要与 `node` 进程的调试协议一致

**代码映射**：
1. `protocol` 和 `remoteRoot` 两个参数用来表示远程代码和本机代码的映射关系。
2. 不配置时可以直接点击调试控制台进入远程只读代码中断点调试
3. 配置时，可以直接在本地文件打断点
4. 如果配置了 sftp 之类的服务，可以通过映射调试远程代码

**注意点**：
远程启动进程时 `host` 尽量使用 `0.0.0.0`，例如 `node inpect --inspect=0.0.0.0:9920 app.js`

## 调试 npm 启动的程序
实现过程：
1. 通过 npm 脚本以 debug 模式启动 node 进程
2. vscode 通过 `launch.json` 中的调试配置监听 npm 启动的进程来调试

**配置示例**：
`launch.json`   
```js
{
  "type": "node",
  "request": "launch",
  "name": "Launch via NPM",
  "runtimeExecutable": "npm",
  "runtimeArgs": [
    "run",
    "debug"
  ],
  "port": 9929
}
```
`package.json`   
```js
...,
"scripts": {
  "debug": "node --inspect=9929 npm/app.js",
},
...
```

## 使用 nodemon
使用 `nodemon` 启动调试省去了代码修改后*退出进程 -> 重启进程*的操作。

nodemon 调试配置如下：
```js
{
  "type": "node",
  "request": "launch",
  "name": "nodemon",
  "runtimeExecutable": "nodemon",
  "program": "${workspaceFolder}/nodemon/app.js",
  "restart": true,
  "console": "integratedTerminal",
  "internalConsoleOptions": "neverOpen",
  "protocol": "inspector"
}
```
注意点：
1. `runtimeExecutable`配置为`nodemon`，并且要保证 `nodemon` 已经全局安装
2. `restart`要配置为`true`，这样 vscode 会在代码改动后监听重启后的进程

## 调试需要编译的程序
对需要编译后才能运行的程序进行debug时我们推荐如下的配置思路：
1. 实时编译源代码（--watch参数）
2. 使用可以热启动的工具启动编译后的代码（例如nodemon）
3. 最好生成 sourcemap 文件来便于调试

### 调试 ES6/ES7 程序
**一、编译源代码**   

```js
/* package.json */
...
"build:es6": "babel ./es6/src -s -w -d ./es6/dist/",
...
```
执行命令：`npm run build:es6`

**二、nodemon 启动调试**
调试配置：
```js
{
  "type": "node",
  "request": "launch",
  "name": "es6:nodemon",
  "runtimeExecutable": "nodemon",
  "program": "${workspaceFolder}/es6/dist/app.js",
  "restart": true,
  "console": "integratedTerminal",
  "internalConsoleOptions": "neverOpen"
}
```
成功启动进程后，可以在源代码中打断点调试

### 调试 coffee 程序
配置调试的思路与 es6 程序相同

**一、编译源代码**   

```js
/* package.json */
...
"build:coffee": "coffee -c -m -w -o ./coffee/dist/ ./coffee/src"
...
```
执行命令：`npm run build:coffee`

**二、nodemon 启动调试**
调试配置：
```
{
  "type": "node",
  "request": "launch",
  "name": "coffee",
  "runtimeExecutable": "nodemon",
  "program": "${workspaceFolder}/coffee/src/index.coffee",
  "outFiles": [
    "${workspaceFolder}/coffee/dist/**.*"
  ],
  "restart": true,
  "console": "integratedTerminal",
  "internalConsoleOptions": "neverOpen"
}
```



## 参考链接
- [vscode 官方文档](https://code.visualstudio.com/docs/editor/debugging#_launchjson-attributes)
- [Visual Studio Code 前端调试不完全指南](http://jerryzou.com/posts/vscode-debug-guide/)
- [Debug in VSCode](https://blog.ymfe.org/Debug-in-vscode/)
- [用vscode调试nodejs+es6+babel](https://juejin.im/post/59fc5ee351882575d22165ba)