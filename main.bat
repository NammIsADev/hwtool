@echo off
Title Huawei Kirin Tool - ver Beta (PROCEED WITH CAUTION! MAY BRICK YOUR DEVICE!)
echo.
echo  *****************************************************************************
echo  * Welcome to Huawei Kirin Tool.                                             *
echo  * Made by Namm - ver 1.0                                                    *
echo  * Script to Unlock Bootloader on Huawei Devices using PotatoNV and Fastboot *
echo  *****************************************************************************
echo.
echo   By agreeing to this disclaimer, you may proceed.
echo   For more details, visit: https://github.com/NammIsADev/hwtool/blob/main/README.md#disclaimer
echo.
pause
echo.

REM Script to Unlock Bootloader on Huawei Devices using PotatoNV and Fastboot

REM **IMPORTANT WARNINGS:**
echo.
echo    [31m********************************************************************************[0m
echo    [31m* Your warranty is now void.                                                    *[0m
echo    [31m* *[0m
echo    [31m* I am not responsible for bricked devices, dead SD cards,                      *[0m
echo    [31m* thermonuclear war, or you getting fired because the alarm app failed. Please   *[0m
echo    [31m* do some research if you have any concerns about features included in this ROM *[0m
echo    [31m* before flashing it! YOU are choosing to make these modifications, and if      *[0m
echo    [31m* you point the finger at me for messing up your device, I will laugh at you.    *[0m
echo    [31m********************************************************************************[0m
echo.
echo    [33mUnlocking your bootloader will void your warranty.[0m
echo.
echo    [33mThis process can potentially brick your device if not followed carefully.[0m
echo.
echo    [33mEnsure you have backed up all your important data before proceeding.[0m
echo.
echo    This script assumes you have ADB and Fastboot tools installed and configured on your computer.
echo.
echo    This script is tailored for Huawei devices that require PotatoNV for bootloader unlocking.
echo.
echo    Works best on EMUI 8/9 (Tested).  
echo    It may not work on EMUI 10 or later.
echo.
echo 	[33mThis script does NOT include PotatoNV. YOU MUST DOWNLOAD IT SEPARATELY.[0m
echo			https://github.com/mashed-potatoes/PotatoNV
echo.
echo    Carefully check the supported devices list on the PotatoNV GitHub page:
echo        https://github.com/NammIsADev/hwtool/blob/main/SUPPORT-DEVICES.md
echo        to confirm your device is supported.
echo 	Maybe your phone isn't on the supported list, but if the chipset is supported, 
echo 		you're still good to go.
echo.
echo    This script provides a general outline. Specific steps and commands might vary slightly
echo        depending on your exact Huawei model and Android version.  Refer to detailed guides
echo        for your specific device.
echo.
echo    This script is intended to support devices with the following Kirin chipsets:
echo        - Kirin 620
echo        - Kirin 650
echo        - Kirin 655
echo        - Kirin 658
echo        - Kirin 659 (including A/B variants)
echo        - Kirin 925
echo        - Kirin 935
echo        - Kirin 950
echo        - Kirin 960
pause
cls

call logo
REM -------------------------------------------------------------------------
REM 1. Device Preparation
REM -------------------------------------------------------------------------

echo.
echo [36m**1. Device Preparation**[0m
echo.
echo    [36ma. Enable Developer Options on your Huawei device:[0m
echo        -   Go to Settings ^> About phone.
echo        -   Tap "Build number" repeatedly (usually 7 times) until "Developer options" is enabled.
echo.
echo    [36mb. Enable USB Debugging and OEM Unlocking in Developer Options:[0m
echo        -   Go to Settings ^> Developer options.
echo        -   Enable "USB debugging".
echo        -   Enable "OEM unlocking".
echo.
echo    [36mc. Open Settings on your Huawei device to the About Phone section:[0m
adb shell am start -n com.android.settings/.Settings
adb shell am start -a android.settings.DEVICE_INFO_SETTINGS
echo.
echo    [36md. Did the Settings app open successfully? (y/n)[0m
set /p "settings_open="
echo.
if /i "%settings_open%"=="n" (
    echo [33mPlease open the Settings app manually and navigate to the About Phone section.[0m
    pause
)
echo.
echo    [36me. If the "OEM unlocking" option is missing or grayed out, this often indicates that PotatoNV is required,[0m
echo        however, it may also indicate other issues preventing bootloader unlocking.  Consult device-specific resources.
echo.
pause
cls
call logo
echo.
echo    [36mf. Install Huawei USB Drivers on your computer (if not already installed).[0m
echo        Download HiSuite from: https://consumer.huawei.com/en/support/hisuite/
echo        You may also need to install Huawei Testpoint Drivers.  These drivers may require Test Mode in Windows.
echo        To enable Test Mode in Windows:
echo        1.  Run Command Prompt as an administrator.
echo        2.  Type the following command and press Enter:
echo            [32mbcdedit /set testsigning on[0m
echo        3.  Restart your computer. A watermark will appear on the desktop indicating Test Mode.
echo        To disable Test Mode, repeat the steps above, but use the command:
echo            [32mbcdedit /set testsigning off[0m
echo        You can find Huawei TestPoint drivers here:
echo        https://files.dc-unlocker.com/share.html?v=share/18B15B9D02C945A79B1967234CECB423
echo.
echo    [36mg. Download the PotatoNV tool for your device from a trusted source and extract to "bin" folder.[0m
echo        https://github.com/mashed-potatoes/PotatoNV
echo.
echo    [36mh. Download the custom ROM and recovery image files (e.g., system.img, recovery.img)
echo        that you intend to flash.  Place them in a folder on your computer where you can
echo        easily access them (e.g., the "flash" as this batch script).  Ensure that the
echo        system image is named "system.img" and the custom recovery image is named "recovery.img".
echo.
pause
REM -------------------------------------------------------------------------
REM 2. Unlock Bootloader using PotatoNV ( required)
REM -------------------------------------------------------------------------

cls
call logo
echo.
echo [36m**2. Unlock Bootloader using PotatoNV (required)**[0m
echo.
echo    The first step is the most difficult thing to do.
echo    You need to disassemble your device: this is necessary in order to access the contacts on the motherboard.
echo    If you're not sure that you have enough experience to disassemble the device,
echo    then consider using paid software, that supports "software testpoint".
echo.
echo    [33mWarning[0m
echo    I strongly recommend watching video manuals for disassembling your device.  A video guide on how to use PotatoNV and testpoint can be found here: https://www.youtube.com/watch?v=YkGugQ019ZY
echo.
echo    [33mWarning[0m
echo    Be extremely careful with planar cables!
echo    These cables are used in tablets, as well as in phones with a fingerprint scanner on the back cover.
echo    You will need: a hair dryer, a guitar pick or a plastic card, conductive tweezers and maybe a screwdriver.
echo.
echo    [36ma. Turning off the device...[0m
echo        adb shell reboot -p
echo.
echo    [36mb. Heat the back cover evenly with a hair dryer.[0m
echo.
echo    [36mc. After a couple of minutes, try to stick the plastic card into the corner between case and lid,[0m
echo        try to lift the edge and then deepen the card.
echo.
echo    [36md. Move around the perimeter of the back cover, peeling off glue.[0m
echo.
echo    [36me. Now you can remove the back cover.[0m
echo.
pause
cls
call logo
echo.
echo [36m**Entering download mode**[0m
echo.
echo    It's time to Google. You need to find the location of a special point on the motherboard: testpoint.
echo.
echo    [33mNote[0m
echo    If you are wondering why you need to do something with the unfortunate testpoint,
echo    then read the contents of the spoiler below.
echo    To search, use the model name before the hyphen + "testpoint".
echo    For example for Honor 9 Lite (LLD-L31) you should Google "lld testpoint".
echo.
echo    Here you will need sleight of hand: This usually involves short-circuiting specific
echo        test points on the motherboard while plugging in the USB cable.
echo.
echo    Open the "Device Manager" – you should see an unknown device named USB SER,
echo    or Serial Port HUAWEI USB COM 1.0.
echo.
echo    If the device has not been detected, make sure you are using a good cable,
echo    the tweezers are not a dielectric, and you are shorting the desired point.
echo.
pause
cls
call logo
echo.
echo [36m**Unlocking the bootloader**[0m
echo    Requirements:
echo    Install HiSuite.
echo    Install Huawei Testpoint Drivers.
echo.
echo    Note: All bootloaders are flashing to RAM, so an incorrect bootloader cannot harm the device.
echo    Note: Disable FBLOCK checkbox (in PotatoNV) disables a special security check. That modification allows you to flash/erase secure partitions or execute oem commands, that are not available with normal unlocking by unlock code [USERLOCK].
echo    Warning: FBLOCK unlocking works correctly only on devices with Kirin 960 or 65x. Disabling this option can cause serious problems on legacy devices.
echo    Now the program will start to detect your phone and chipset. Please plug your phone to your PC (allow ADB auth too) and press Enter.
pause
cls
call logo
echo.
REM Use PowerShell to get the Windows version
for /f "tokens=2 delims==" %%i in ('%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -Command "$([Environment]::OSVersion.Version.Major)"') do set "win_version=%%i"
echo [36m**DETECT DEVICE**[0m
adb shell getprop ro.product.manufacturer > manufacturer.txt
adb shell getprop ro.product.model > model.txt
set /p manufacturer=<manufacturer.txt
set /p model=<model.txt
del manufacturer.txt model.txt
echo Manufacturer: %manufacturer%
echo Model: %model%
IF "%manufacturer%"=="Huawei" OR "%manufacturer%"=="HW" (
    echo Device detected: Huawei %model% - Your phone maybe supported/unsupported. Please refer to the Support Deivce board. 
    echo Close the program now, unplug your device if your chipset is not supported.
    echo Or else, your phone will turned to brick.
    echo [36m**DETECT CHIPSET**[0m
    adb shell getprop ro.board.platform > chipset.txt
    set /p chipset=<chipset.txt
    del chipset.txt
    echo Chipset: %chipset%
    IF "%chipset%"=="mtk" OR "%chipset%"=="Qualcomm" OR "%manufacturer%"=="mediatek" (
        echo.
        echo [36mAlternatives to PotatoNV - HCU Client**[0m
        echo.
        echo As far as I know, there is currently only one tool that can deal with newer CPUs — HCU Client.
        echo This software requires a license, the most affordable plan is 3 days of access for €19.
        echo See supported models by HCU Client here: https://hcu-client.com/supported-models.php
        echo Note: Timed licenses are locked to the first used PC for two days. Therefore, it would be problematic to use such a license on more than one phone.
        echo Disclaimer: I am not affiliated, associated, authorized, endorsed by, or in any way officially connected with UAB Digiteka, or any of its subsidiaries or its affiliates, including DC-Phoenix and HCU Client.
        echo.
        pause
        exit /b
    )
    IF "%chipset%"=="hi6250" (
        echo.
        echo    [33mNote: Your device has a Kirin 659 chipset. PotatoNV supports this chipset,[0m
        echo    [33m      including A and B variants. Please proceed with the instructions.[0m
        echo.
    )
) ELSE (
    echo Device detected: %manufacturer% %model%
    echo This device may not be a Huawei device.
	pause
    exit /b
)

IF %win_version% GEQ 10 (
    echo    [36ma.  Are you ready to proceed with the bootloader unlock process? (y/n)[0m
    set /p "ready_to_unlock="
     IF /i "%ready_to_unlock%"=="y" (
        echo    [36mb.  Power off your Huawei device.[0m
        adb shell reboot -p
        echo.
        echo    [36mc.  Disassemble your Huawei device to access the motherboard test points.[0m
        echo        Follow a video guide specific to your Huawei model.
        echo.
        echo    [36md.  Connect your device to your computer when touching test point, as[0m
        echo        described in the PotatoNV instructions.
        echo.
        echo    [36me.  Run the PotatoNV tool.[0m
        if exist "%cd%\bin\PotatoNV.exe" (
             start "" "%cd%\bin\PotatoNV.exe"
        ) else (
            echo [31mPotatoNV.exe not found. Please ensure PotatoNV is correctly placed.[0m
            pause
            exit /b 1
        )
        echo.
        echo    [36mf.  Follow the instructions in the PotatoNV tool to unlock the bootloader.  This process[0m
        echo        may involve selecting the correct COM port and initiating the unlock.
        echo.
        echo    [36mg.  If PotatoNV provides an unlock code, write it down. You will need it later.[0m
        echo.
        echo    [36mh.  Enter the unlock code provided by PotatoNV: (format: fastboot oem unlock YOUR_CODE_HERE)[0m
        set /p "unlock_code="
		echo	[36mi.  Reboot the phone to fastboot mode. (press Volume Down + Power + Cable Connect)
		echo	[36m    Please press [Enter] when you are done.
		pause
        fastboot oem unlock %unlock_code%
        echo.
        echo    [36j.  Once the bootloader is unlocked (either directly by PotatoNV or with an unlock code),[0m
            echo        proceed to the next step.
     ) ELSE(
        echo [31mUser is not ready to proceed, exiting...[0m
        exit /b 1
     )
) ELSE (
    echo    [36ma.  Are you ready to proceed with the bootloader unlock process? (y/n)[0m
    set /p "ready_to_unlock="
     IF /i "%ready_to_unlock%"=="y" (
        echo    [36mb.  Power off your Huawei device.[0m
        adb shell reboot -p
        echo.
        echo    [36mc.  Disassemble your Huawei device to access the motherboard test points.[0m
        echo        Follow a video guide specific to your Huawei model. 
        echo.
        echo    [36md.  Connect your device to your computer when toching the test point, as[0m
        echo        described in the PotatoNV instructions.
        echo.
        echo    [36me.  Run the PotatoNV tool.[0m
		if exist "%cd%\bin\PotatoNV.exe" (
			start "" "%cd%\bin\PotatoNV.exe"
		) else (
			echo [31mPotatoNV.exe not found in the default location (bin folder).[0m
			set /p "customPath=Please enter the full path to PotatoNV.exe: "

		if exist "%customPath%" (
			start "" "%customPath%"
		) else (
			echo [31mPotatoNV.exe not found at the specified location: "%customPath%".[0m
        pause
		)
	)
        echo.
        echo    [36mf.  Follow the instructions in the PotatoNV tool to unlock the bootloader.  This process[0m
        echo        may involve selecting the correct COM port and initiating the unlock.
        echo.
        echo    [36mg.  If PotatoNV provides an unlock code, write it down.  You will need it later.[0m
        echo.
        echo     [36mh.  Enter the unlock code provided by PotatoNV: (format: fastboot oem unlock YOUR_CODE_HERE)[0m
        set /p "unlock_code="
		echo	[36mi.  Reboot the phone to fastboot mode. (press Volume Down + Power + Cable Connect)
		echo	[36m    Please press [Enter] when you are done.
		pause
        fastboot oem unlock %unlock_code%
        echo.
        echo    [36i.  Once the bootloader is unlocked (either directly by PotatoNV or with an unlock code),[0m
            echo        proceed to the next step.
     ) ELSE (
        echo [31mUser is not ready to proceed, exiting...[0m
        exit /b 1
     )
)

pause
REM -------------------------------------------------------------------------
REM 4. Flash Custom Recovery and System
REM -------------------------------------------------------------------------
cls
call logo
echo.
echo [36m**4. Flash Custom Recovery and System**[0m
echo.
echo    a.  This step assumes you have the correct recovery image (e.g., recovery.img)
echo        and system image (e.g., system.img) for your device.
echo.
echo    b.  The following commands are examples.  Adjust the file names if yours are different.
echo        The recovery partition may also be named differently depending on the device.
echo.
echo    c.  Make sure, the phone is in fastboot mode.
echo.
echo    d.  ROM MUST BE AS SYSTEM.IMG. OR ELSE YOU NEED TO FLASH WITH TWRP.
echo        If your ROM is not System.img, you can skip this step.
echo        Note: All ROM are flashing to partition, but an incorrect ROM cannot harm the device.
echo        Because when the phone received the ROM, fastboot check for format, metadata, etc.
echo        If the ROM failed the check, fastboot refuses to flash.
echo.
echo    [36mIMPORTANT: Place the system.img and recovery.img files in the same directory as this script before proceeding.[0m
echo.
echo    [36mDo you want to flash a custom recovery and system image?[0m
echo    [36mEnter 'y' to flash, or 'n' to skip: [0m
set /p "flash_choice="
echo.

if /i "%flash_choice%"=="y" (
    echo [32mFlashing system image...[0m
    fastboot flash system system.img
    echo.
    echo [32mFlashing custom recovery image...[0m
    fastboot flash recovery_ramdisk recovery.img
) else (
    echo [32mSkipping flashing system and recovery images.[0m
)

REM -------------------------------------------------------------------------
REM 5. Wipe Data (Optional, but often required)
REM -------------------------------------------------------------------------
cls
call logo
echo.
echo [36m**5. Wipe Data (Optional, but often required)**[0m
echo.
echo    a.  Wiping data is often necessary after flashing a custom ROM to prevent boot loops
echo        or other issues.  This will erase all data on your phone's internal storage
echo        (apps, settings, photos, etc.).
echo.
echo    b.  If you are flashing a custom ROM, it is highly recommended to wipe data.
echo.
echo    c.  The following command will wipe data.
echo.
echo    d.  This is required because when you don't wipe data, you CAN boot normally, but the system will ask you
echo    for wipe data because verify failed. (idk maybe something)
echo.
echo    Mostly eRecovery will showing "Serious problem can't boot etc." before booting the OS. Ask user to wipe their data.
echo.
fastboot -w
REM -------------------------------------------------------------------------
REM 6. Reboot the device
REM -------------------------------------------------------------------------
cls
call logo
echo.
echo [36m**6. Reboot the device**[0m
echo.
echo    a.  After flashing and wiping data, this command reboot your device.
echo.
fastboot reboot
echo.
echo    Your device will now reboot.  The first boot after flashing a custom ROM may take
echo    several minutes.  Be patient and do not interrupt the process.
echo.
echo    If you are getting bootloop, you can run this guide again, replace the system.img/recovery.img, and try again to flash.
echo.
echo    Happy modding!
echo.
echo [32m========================================================================[0m
echo [32m                               Finished! Enjoy!                                  [0m
echo [32m========================================================================[0m
pause
exit

:logo
echo.
echo [32m========================================================================[0m
echo [32m         HWTool (Huawei Kirin Tool) (PotatoNV & Fastboot)[0m
echo [32m========================================================================[0m
echo.