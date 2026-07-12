import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import path from 'node:path'
import test from 'node:test'

const scriptPath = path.resolve('scripts/release-protected-exe.ps1')

test('protected exe release script publishes only the Windows installer for the package version', async () => {
  const script = await readFile(scriptPath, 'utf8')

  assert.match(script, /Get-Content\s+\$resolvedPackageJsonPath\s+-Raw\s+\|\s+ConvertFrom-Json/)
  assert.match(script, /\$Version\s*=\s*\$package\.version/)
  assert.match(script, /\$tag\s*=\s*"v\$Version"/)
  assert.match(script, /dist-electron-protected/)
  assert.match(script, /AIPC UP Setup \$Version\.exe/)
  assert.match(script, /gh release create/)
  assert.match(script, /gh release upload/)
  assert.doesNotMatch(script, /\*\.exe/)
  assert.doesNotMatch(script, /blockmap/)
  assert.doesNotMatch(script, /dist-electron(?!-protected)/)
  assert.doesNotMatch(script, /encrypted/i)
})

test('protected exe release script keeps PowerShell param block first', async () => {
  const script = await readFile(scriptPath, 'utf8')

  assert.match(script.trimStart(), /^param\(/)
})

test('protected exe release script treats missing releases as create path', async () => {
  const script = await readFile(scriptPath, 'utf8')

  assert.match(script, /\$previousErrorActionPreference = \$ErrorActionPreference/)
  assert.match(script, /\$ErrorActionPreference = "Continue"/)
  assert.match(script, /gh release view \$tag --repo \$Repo 2>\$null/)
  assert.doesNotMatch(script, /gh release view \$tag --repo \$Repo \*>\s*\$null/)
  assert.match(script, /\$releaseExists = \$LASTEXITCODE -eq 0/)
  assert.match(script, /\$ErrorActionPreference = \$previousErrorActionPreference/)
})

test('protected exe release script can use bundled GitHub CLI', async () => {
  const script = await readFile(scriptPath, 'utf8')

  assert.match(script, /\.local-tools\\gh\\gh\.exe/)
  assert.match(script, /\$gh = /)
  assert.match(script, /& \$gh auth status/)
  assert.match(script, /& \$gh release create/)
  assert.match(script, /& \$gh release upload/)
})
