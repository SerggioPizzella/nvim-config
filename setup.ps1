[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%HOMEDRIVE%%HOMEPATH%\.config", "User")
[Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "%HOMEDRIVE%%HOMEPATH%\.cache", "User")
[Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "%HOMEDRIVE%%HOMEPATH%\.local\share", "User")
[Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "%HOMEDRIVE%%HOMEPATH%\.local\state", "User")

function reload_path() {
	$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted

# Setup winget
Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery -Scope CurrentUser
Repair-WinGetPackageManager

$apps = @(
	"7zip.7zip"
	"Git.Git",
	"junegunn.fzf",
	"BurntSushi.ripgrep.MSVC",
	"Microsoft.PowerToys",
	"Python.Python.3.13",
	"BrechtSanders.WinLibs.POSIX.UCRT.LLVM",
)

foreach ($app in $apps) {
	winget install -e -id $app
}
reload_path

# Setup Node
$fnm_setup = "
# Setup node
fnm completions --shell powershell | Out-String | Invoke-Expression
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
"
Add-Content -Path $Profile.CurrentUserAllHosts -Value $fnm_setup -NoNewline
fnm install --lts
