SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files (x86)\VMware\VMware Player\bin\;C:\Program Files\Python38\Scripts\;C:\Program Files\Python38\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\Program Files\Git\cmd;C:\Users\carlh\AppData\Local\Programs\Python\Python312\Scripts\;C:\Users\carlh\AppData\Local\Programs\Python\Python312\;C:\Users\carlh\AppData\Local\Microsoft\WindowsApps;C:\Users\carlh\AppData\Local\GitHubDesktop\bin;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\carlh\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\carlh\AppData\Local\Programs\Python\Python312\Scripts\;C:\Users\carlh\AppData\Local\Programs\Python\Python312\;C:\Users\carlh\AppData\Local\Microsoft\WindowsApps;C:\Users\carlh\AppData\Local\GitHubDesktop\bin;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\carlh\AppData\Local\Programs\Microsoft VS Code\bin;c:\BrAutomation\AS412\Bin-en\4.12;c:\BrAutomation\AS412\Bin-en\4.11;c:\BrAutomation\AS412\Bin-en\4.10;c:\BrAutomation\AS412\Bin-en\4.9;c:\BrAutomation\AS412\Bin-en\4.8;c:\BrAutomation\AS412\Bin-en\4.7;c:\BrAutomation\AS412\Bin-en\4.6;c:\BrAutomation\AS412\Bin-en\4.5;c:\BrAutomation\AS412\Bin-en\4.4;c:\BrAutomation\AS412\Bin-en\4.3;c:\BrAutomation\AS412\Bin-en\4.2;c:\BrAutomation\AS412\Bin-en\4.1;c:\BrAutomation\AS412\Bin-en\4.0;c:\BrAutomation\AS412\Bin-en
export AS_BUILD_MODE := BuildAndCrossReference
export AS_VERSION := 4.12.2.93
export AS_WORKINGVERSION := 4.12
export AS_COMPANY_NAME :=  
export AS_USER_NAME := carlh
export AS_PATH := c:/BrAutomation/AS412
export AS_BIN_PATH := c:/BrAutomation/AS412/Bin-en
export AS_PROJECT_PATH := c:/repos/local/FactoryIO_Storage
export AS_PROJECT_NAME := FactoryIO_Storage
export AS_SYSTEM_PATH := c:/BrAutomation/AS/System
export AS_VC_PATH := c:/BrAutomation/AS412/AS/VC
export AS_TEMP_PATH := c:/repos/local/FactoryIO_Storage/Temp
export AS_CONFIGURATION := Config1
export AS_BINARIES_PATH := c:/repos/local/FactoryIO_Storage/Binaries
export AS_GNU_INST_PATH := c:/BrAutomation/AS412/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := c:/BrAutomation/AS412/AS/GnuInst/V4.1.2/4.9/bin
export AS_GNU_INST_PATH_SUB_MAKE := c:/BrAutomation/AS412/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := c:/BrAutomation/AS412/AS/GnuInst/V4.1.2/4.9/bin
export AS_INSTALL_PATH := c:/BrAutomation/AS412
export WIN32_AS_PATH := "c:\BrAutomation\AS412"
export WIN32_AS_BIN_PATH := "c:\BrAutomation\AS412\Bin-en"
export WIN32_AS_PROJECT_PATH := "c:\repos\local\FactoryIO_Storage"
export WIN32_AS_SYSTEM_PATH := "c:\BrAutomation\AS\System"
export WIN32_AS_VC_PATH := "c:\BrAutomation\AS412\AS\VC"
export WIN32_AS_TEMP_PATH := "c:\repos\local\FactoryIO_Storage\Temp"
export WIN32_AS_BINARIES_PATH := "c:\repos\local\FactoryIO_Storage\Binaries"
export WIN32_AS_GNU_INST_PATH := "c:\BrAutomation\AS412\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "c:\BrAutomation\AS412\AS\GnuInst\V4.1.2\bin"
export WIN32_AS_INSTALL_PATH := "c:\BrAutomation\AS412"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/4.9/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/FactoryIO_Storage.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'    -buildMode 'BuildAndCrossReference'   

