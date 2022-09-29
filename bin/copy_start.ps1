function Set-StartMenu() {
  $ConfigPath = "$env:LocalAppData\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState"
  $leaf = 'start.bin'

  Copy-Item -Force $PSScriptRoot\..\lib\$leaf $ConfigPath\$leaf
}
