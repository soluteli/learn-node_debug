## node-debug
Node.JS 各种调试姿势的示例代码

## 相关vscode调试配置
```json
{
  // 使用 IntelliSense 了解相关属性。 
  // 悬停以查看现有属性的描述。
  // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "es6:nodemon",
      "runtimeExecutable": "nodemon",
      "program": "${workspaceFolder}/es6/dist/app.js",
      "restart": true,
      "console": "integratedTerminal",
      "internalConsoleOptions": "neverOpen"
    },
    {
      "type": "node",
      "request": "launch",
      "protocol": "inspector",
      "name": "nodemon",
      "runtimeExecutable": "nodemon",
      "program": "${workspaceFolder}/nodemon/app.js",
      "restart": true,
      "console": "integratedTerminal",
      "internalConsoleOptions": "neverOpen"
    },
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
    },
    {
      "type": "node",
      "request": "attach",
      "name": "Docker: Attach to Node",
      "port": 9929,
      "address": "localhost",
      "localRoot": "${workspaceFolder}/attach",
      "remoteRoot": "/home/app",
      "protocol": "inspector"
    },
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
    },
    {
      "type": "node",
      "request": "launch",
      "protocol": "inspector",
      "name": "vs launch cur file",
      "program": "${file}"
    },
    {
      "type": "node",
      "request": "launch",
      "protocol": "inspector",
      "name": "vscode Launch cwd",
      "program": "${workspaceFolder}/vscode/04-cwd.js",
      "cwd": "${workspaceFolder}/legacy"
    },
    {
      "type": "node",
      "request": "launch",
      "protocol": "inspector",
      "name": "vscode Launch env",
      "program": "${workspaceFolder}/vscode/03-env.js",
      "env": {
        "level": "info"
      }
    },
    {
      "type": "node",
      "request": "launch",
      "protocol": "inspector",
      "name": "vscode Launch args",
      "program": "${workspaceFolder}/vscode/02-args.js",
      "args":[
        "c",
        "-a", "aaa",
        "-b", "bbb"
      ]
    },
    {
      "type": "node",
      "request": "launch",
      "protocol": "inspector",
      "name": "vscode Launch sample",
      "program": "${workspaceFolder}/vscode/01-sample.js"
    },
    {
      "type": "node",
      "request": "launch",
      "name": "Demo",
      "program": "${workspaceFolder}/inspector/demo.js",
    }
  ]
}
```