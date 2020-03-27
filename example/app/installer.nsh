# define name of installer
OutFile "installer.exe"
 
# define installation directory
InstallDir "C:\app"
 
# For removing Start Menu shortcut in Windows 7
RequestExecutionLevel user
 
# start default section
Section
    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR

    File "app.pyz"
    File /r "python"
    File "start.bat"
 
    # create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd
 
# uninstaller section start
Section "uninstall"
 
    # first, delete the uninstaller
    Delete "$INSTDIR\uninstall.exe"

    # delete all
    rmDir /r $INSTDIR
 
# uninstaller section end
SectionEnd
