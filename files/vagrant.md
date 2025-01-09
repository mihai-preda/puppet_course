# Instructions
# vagrant doesn't recognize the vmware provider
The common errror is: "No usable default provider could be found for your system."
Configer the following ENV var in windows: $Env:VAGRANT_DEFAULT_PROVIDER = "vmware_desktop" in PowerShell or
manually in Windows env variabls for the user scope.