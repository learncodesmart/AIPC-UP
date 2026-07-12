# Windows 安装包 GitHub Release 发布说明

本文档说明如何把本地打包后的 Windows 安装包发布到 GitHub Release。

目标仓库：

```text
learncodesmart/AIPC-UP
```

只发布这个文件：

```text
dist-electron-protected/AIPC UP Setup <version>.exe
```

不会发布：

- `dist-electron-protected/*.blockmap`
- `dist-electron-protected/win-unpacked/`
- `dist-electron/`
- 其他构建产物

## 首次准备

发布脚本依赖 GitHub CLI。第一次使用前先安装：

```powershell
winget install --id GitHub.cli
```

认证方式二选一。

### 方式一：GitHub CLI 登录

```powershell
gh auth login
```

登录时选择能访问 `learncodesmart/AIPC-UP` 的 GitHub 账号。

### 方式二：使用 token 文件

如果使用 Personal Access Token，可以把 token 放到根目录：

```text
github-release-token.txt
```

发布前在当前 PowerShell 窗口执行：

```powershell
$env:GH_TOKEN = (Get-Content -Raw .\github-release-token.txt).Trim()
```

token 权限建议：

- Fine-grained token：Repository permissions 里 `Contents` 选择 `Read and write`，`Metadata` 保持 `Read-only`。
- Personal access tokens (classic)：公开仓库可用 `public_repo`；私有仓库使用 `repo`。

发布完成后建议删除 `github-release-token.txt`，或者在 GitHub 后台吊销这个 token。

## 日常发布

先确认已经生成 Windows 安装包，例如：

```text
dist-electron-protected/AIPC UP Setup 1.0.0.exe
```

如果使用 token 文件，先设置当前 PowerShell 窗口的 `GH_TOKEN`：

```powershell
$env:GH_TOKEN = (Get-Content -Raw .\github-release-token.txt).Trim()
```

然后在项目根目录执行：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/release-protected-exe.ps1
```

脚本会自动读取根目录 `package.json` 的版本号。

当前如果 `package.json` 是：

```json
{
  "version": "1.0.0"
}
```

脚本会发布：

```text
GitHub Release/tag: v1.0.0
上传文件: dist-electron-protected/AIPC UP Setup 1.0.0.exe
```

发布完成后，页面地址类似：

```text
https://github.com/learncodesmart/AIPC-UP/releases/tag/v1.0.0
```

## 指定版本发布

如果需要手动指定版本，可以执行：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/release-protected-exe.ps1 -Version 1.0.0
```

这会查找：

```text
dist-electron-protected/AIPC UP Setup 1.0.0.exe
```

并发布到：

```text
v1.0.0
```

## 版本号规则

脚本默认使用根目录 `package.json` 的 `version` 字段。
软件内部的更新检测会读取 `aipc-up/package.json` 的 `version` 字段。

因此发布新版本时，建议让这两个文件的版本号保持一致：

```text
package.json
aipc-up/package.json
```

发布新版本时建议按这个顺序操作：

1. 修改根目录 `package.json` 和 `aipc-up/package.json` 里的 `version`，例如都改成 `1.0.1`。
2. 重新生成 Windows 安装包。
3. 确认文件存在：`dist-electron-protected/AIPC UP Setup 1.0.1.exe`。
4. 执行发布脚本。

脚本会自动创建远程 GitHub Release/tag，例如 `v1.0.1`。

如果远程 Release 已经存在，脚本会覆盖上传同名安装包资产。

## 常见错误

### GitHub CLI was not found

说明没有安装 `gh`。

处理：

```powershell
winget install --id GitHub.cli
```

### GitHub CLI is not logged in

说明已经安装 `gh`，但当前没有可用认证。

处理方式二选一：

```powershell
gh auth login
```

或者：

```powershell
$env:GH_TOKEN = (Get-Content -Raw .\github-release-token.txt).Trim()
```

### Cannot find installer

说明脚本没有找到对应版本的安装包。

例如当前版本是 `1.0.1`，脚本会找：

```text
dist-electron-protected/AIPC UP Setup 1.0.1.exe
```

处理：

- 确认已经重新打包。
- 确认安装包文件名里的版本号和 `package.json` 一致。
- 如果软件内部版本也要同步，确认 `aipc-up/package.json` 版本号一致。
- 或者用 `-Version` 指定实际要发布的版本。

### Release publish failed

通常是 GitHub 权限、网络、仓库名或 Release 资产上传失败。

可以先检查：

```powershell
gh auth status
gh release view v1.0.0 --repo learncodesmart/AIPC-UP
```

如果使用 token 文件，先确认当前 PowerShell 窗口已经设置：

```powershell
$env:GH_TOKEN
```

## 脚本位置

发布脚本：

```text
scripts/release-protected-exe.ps1
```

自检脚本：

```text
scripts/test/release-protected-exe.test.mjs
```

运行自检：

```powershell
.\.local-tools\node22\node.exe --test scripts/test/release-protected-exe.test.mjs
```
