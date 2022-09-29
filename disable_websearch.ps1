function disable-11() {
  $SearchPath = 'HKCU:\SOFTWARE\Policies\Microsoft\Windows'
  $KeyName    = 'Explorer'
  $PropName   = 'DisableSearchBoxSuggestions'

  if(!(Test-Path "$SearchPath\$KeyName")) {
    New-Item -Path $SearchPath -Name $KeyName
    New-ItemProperty -Path "$SearchPath\$KeyName" -Name $PropName -Value 1
  } else { "$SearchPath\$KeyName already exists!" }


}

function disable-10() {
  $SearchPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion'
  $KeyName    = 'Search'
  $PropName   = 'BingSearchEnabled'

  if(!(Get-ItemProperty "$SearchPath\$KeyName"|findstr /i bingsearch)) {
    New-ItemProperty -Path "$SearchPath\$KeyName" -Name $PropName -Value 0
  } else { "$SearchPath\$KeyName already exists!" }
}

function Disable-WebSearch() {
  $WinVer = (Get-ComputerInfo).OSName.split(' ')[2]

  switch($WinVer) {
    10 { disable-10 }
    11 { disable-11 }
    default { "Failed to detect Windows Version" }
  }
}

