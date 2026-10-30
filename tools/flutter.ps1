param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]] $FlutterArgs
)

$FlutterRoot = Join-Path $PSScriptRoot '..\.tools\flutter'
$FlutterConfig = Join-Path $PSScriptRoot '..\.tools\flutter-config'
$FlutterCommand = Join-Path $FlutterRoot 'bin\flutter.bat'

if (-not (Test-Path -LiteralPath $FlutterCommand)) {
  throw "Flutter SDK nao encontrado em $FlutterRoot"
}

New-Item -ItemType Directory -Force -Path $FlutterConfig | Out-Null
$env:APPDATA = (Resolve-Path -LiteralPath $FlutterConfig).Path
$AndroidSdk = Join-Path $env:LOCALAPPDATA 'Android\Sdk'
if (Test-Path -LiteralPath $AndroidSdk) {
  $env:ANDROID_HOME = $AndroidSdk
}

& $FlutterCommand @FlutterArgs
exit $LASTEXITCODE
