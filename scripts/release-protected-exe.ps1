param(
  [string]$Version = "",
  [string]$Repo = "learncodesmart/AIPC-UP",
  [string]$PackageJsonPath = "package.json"
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$resolvedPackageJsonPath = if ([System.IO.Path]::IsPathRooted($PackageJsonPath)) {
  $PackageJsonPath
} else {
  Join-Path $repoRoot $PackageJsonPath
}

if (-not (Test-Path -LiteralPath $resolvedPackageJsonPath)) {
  throw "Cannot find package.json at: $resolvedPackageJsonPath"
}

$package = Get-Content $resolvedPackageJsonPath -Raw | ConvertFrom-Json
if ([string]::IsNullOrWhiteSpace($Version)) {
  $Version = $package.version
}

if ([string]::IsNullOrWhiteSpace($Version)) {
  throw "Version is empty. Set package.json version or pass -Version."
}

$tag = "v$Version"
$installerPath = Join-Path $repoRoot "dist-electron-protected\AIPC UP Setup $Version.exe"

if (-not (Test-Path -LiteralPath $installerPath)) {
  throw "Cannot find installer: $installerPath"
}

$ghCommand = Get-Command gh -ErrorAction SilentlyContinue
$bundledGhPath = Join-Path $repoRoot ".local-tools\gh\gh.exe"
$gh = if ($ghCommand) {
  $ghCommand.Source
} elseif (Test-Path -LiteralPath $bundledGhPath) {
  $bundledGhPath
} else {
  throw "GitHub CLI was not found. Install it with: winget install --id GitHub.cli"
}

& $gh auth status
if ($LASTEXITCODE -ne 0) {
  throw "GitHub CLI is not logged in. Run: gh auth login"
}

Write-Host "Repository: $Repo"
Write-Host "Release tag: $tag"
Write-Host "Installer: $installerPath"

$previousErrorActionPreference = $ErrorActionPreference
try {
  $ErrorActionPreference = "Continue"
  & $gh release view $tag --repo $Repo 2>$null
  $releaseExists = $LASTEXITCODE -eq 0
} finally {
  $ErrorActionPreference = $previousErrorActionPreference
}

if ($releaseExists) {
  Write-Host "Release already exists. Uploading installer and replacing the old asset if needed..."
  & $gh release upload $tag $installerPath --repo $Repo --clobber
} else {
  Write-Host "Release does not exist. Creating release and uploading installer..."
  & $gh release create $tag $installerPath `
    --repo $Repo `
    --title "AIPC UP $Version" `
    --notes "AIPC UP Windows installer $Version" `
    --latest
}

if ($LASTEXITCODE -ne 0) {
  throw "Release publish failed."
}

Write-Host "Done: https://github.com/$Repo/releases/tag/$tag"
