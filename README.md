<div align="center">

# HWTool (Huawei Kirin Tool)

![HWTool Logo](logo.png)

💻 **HWTool** is designed to simplify the process of unlocking Huawei bootloaders. It provides support for a wide range of Kirin chipset devices and customization possibilities, such as flashing TWRP and custom ROMs.

</div>

---

## 📜 Table of Contents
<details>
  <summary>Open it!</summary>

- [Disclaimer](#-disclaimer)
- [What is HWTool?](#-what-is-hwtool)
- [How HWTool Works](#-how-hwtool-works)
- [Features](#-features)
- [Getting Started](#-getting-started)
- [Step-by-Step Guide](#-step-by-step-guide)
  - [Disassembling Your Device](#-disassembling-your-device)
  - [Entering Download Mode](#-entering-download-mode)
  - [Unlocking the Bootloader](#-unlocking-the-bootloader)
- [Supported Devices](#-supported-devices)
- [Troubleshooting](#-troubleshooting)
- [Credits](#-credits)
- [License](#-license)

</details>

---

## ⚠️ Disclaimer

By using HWTool, you agree to the following terms:

> [!CAUTION]
> - Unlocking your bootloader **will void your warranty.**
> - I am **not responsible for any damages**, including but not limited to:
>   - Bricked devices  
>   - Dead SD cards  
>   - Other issues or malfunctions  
> - **Do your research** before proceeding. Ensure you understand the risks associated with using this tool and any ROMs or recoveries.  
> - YOU are solely responsible for any modifications made to your device. **Proceed at your own risk.**

---

## 🔧 What is HWTool?

HWTool provides efficient solutions for bootloader unlocking, flashing recoveries, installing custom ROMs, and managing device recovery for Huawei smartphones and tablets with Kirin chipsets. Tailored for devices requiring **PotatoNV**, it enhances support for specific models running **EMUI 8** and **EMUI 9**.

---

# ❓ How HWTool Works

## 🛠 How PotatoNV Works
[Click here for more info](https://github.com/mashed-potatoes/PotatoNV?tab=readme-ov-file#how-it-works)

---

## 📋 How HWTool Works
HWTool guides you step-by-step, automating the process using **ADB** and **Fastboot** tools. Here’s what it does:

1. **Setup:**
   - Guides you on installing additional drivers, such as **Huawei Testpoint Drivers.**

2. **Disassembly Guidance:**
   - Provides detailed instructions for safely disassembling your device to access the testpoint.
   - Suggests tools like a plastic card, hair dryer, and tweezers for the process.

3. **Flash Process:**
   - Uses **Fastboot** and **ADB** to flash:
     - Custom ROMs tailored for your device.
     - Custom recovery tools like **TWRP.**

4. **Bootloader Unlocking:**
   - Automatically flashes the bootloader into RAM.
   - Includes optional steps, such as disabling FBLOCK security checks for advanced unlocking.

5. **Recovery and ROM Installation:**
   - Guides you through flashing TWRP recovery and installing your selected ROM onto the system.
   - Ensures correct partitioning and compatibility to prevent errors.

---

## 📋 Features

- Unlock bootloaders for supported Huawei Kirin devices.
- Flash custom recovery tools like **TWRP**.
- Install custom ROMs on compatible devices.

---

## 🚀 Getting Started

### 📂 Requirements:
1. **ADB** tools must already be installed and configured on your computer.  
2. Download and install **PotatoNV** (not included in HWTool).  
   - Refer to the PotatoNV GitHub repository: [PotatoNV](https://github.com/mashed-potatoes/PotatoNV).  
3. Obtain compatible files:
   - Android versions **8** or **9**.
   - **TWRP** recovery.  
   - A custom **ROM** suitable for your device.  
4. Backup all important data to avoid any loss during the process.

### 🛠 Steps:
1. Verify your device is listed in the [Supported Devices List](https://github.com/NammIsADev/hwtool/blob/main/SUPPORT-DEVICES.md).
2. Install PotatoNV and follow HWTool instructions to unlock your bootloader.
   2.1. This process can potentially brick your device if not followed carefully.

## 🔩 Step 1: Disassembling Your Device
1. **Access the Motherboard:** Disassembling is required to access the contacts on the motherboard.
2. **Experience Check:** 
   - If you are unsure about your ability to disassemble the device safely, consider using paid software that supports "software testpoint."
3. **Watch Video Guides:** I strongly recommend watching video manuals to understand the disassembly process. Here's a helpful video on using PotatoNV and testpoint: [Watch Video](https://www.youtube.com/watch?v=YkGugQ019ZY).
4. **Be Careful with Planar Cables:** 
   - These are often found in tablets and phones with fingerprint scanners on the back cover.
   - Handle cables gently to avoid damage.

---

## 🧰 Tools Required
- Hair dryer
- Guitar pick or plastic card
- Conductive tweezers
- Screwdriver (if needed)

---

## 📂 Steps to Remove the Back Cover
1. **Turn Off the Device:** Shut down the device completely before proceeding.  
2. **Heat the Back Cover:**
   - Use a hair dryer to heat the cover evenly for a couple of minutes.
3. **Insert a Plastic Card:**
   - Place the card into a corner between the case and lid.
   - Gently lift the edge and slide the card deeper.
4. **Peel Off Glue:** Move the card around the perimeter to loosen and peel off the adhesive.
5. **Remove the Back Cover:** Once the glue is loose, carefully detach the cover.

---

## 🚀 Step 2: Entering Download Mode
1. **Locate the Testpoint:**
   - Use Google to find the testpoint location specific to your device. Search for the model name before the hyphen + "testpoint."  
     For example: For Honor 9 Lite (LLD-L31), search for "LLD testpoint."
     Here a image for example:
    ![Testpoint Example](testpoint_diagram.png)

2. **Short-Circuit Testpoint:**
   - Typically, this involves short-circuiting specific test points on the motherboard while connecting a USB cable to your computer.
3. **Verify Detection:**
   - Open "Device Manager" on your computer.
   - Look for an unknown device named **USB SER** or **Serial Port HUAWEI USB COM 1.0.**
4. **Troubleshooting:**
   - Ensure you're using a good-quality cable.
   - Verify the tweezers are conductive.
   - Double-check that you're shorting the correct testpoint.

---

## 🔓 Step 3: Unlocking the Bootloader
1. **Install Necessary Software:**
   - **HiSuite**: Required for Huawei device management.
   - **Huawei Testpoint Drivers**: Necessary for proper detection of your device in download mode.
2. **Flash the Bootloader to RAM:**
   - Incorrect bootloader flashes won't harm the device because they are loaded into RAM.
3. **Disable FBLOCK (Optional):**
   - This disables a security check, allowing you to flash/erase secure partitions or execute advanced commands.  
     ⚠ **Warning:** FBLOCK is recommended only for devices with Kirin 960 or 65x. It may cause serious issues on older devices.
4. **Select Bootloader:** Refer to the provided table or software options for selecting the appropriate bootloader for your device.
5. **Complete the Process:**
   - Click the Start button in the tool. The entire procedure should take no more than a minute.
   - Save the generated unlock code in a secure place.

4. Use TWRP and custom ROMs to further customize your device.

> [!TIP]
> If you are using a **Nova 2i / Honor 9i**, you CAN apply Mate 10 Lite Recovery/ROM for compatibility.

---

## 📱 Supported Devices

For the complete list of supported devices, visit:  
[Supported Devices](https://github.com/NammIsADev/hwtool/blob/main/SUPPORT-DEVICES.md)

---

## ⚠ Additional Warnings

- Unlocking the bootloader **voids your warranty.**
- Misuse of this tool may **brick your device** or cause irreparable damage.
- PotatoNV is required but **not included in HWTool**. You must download it separately.
- Compatibility with EMUI **10 or later** has **not been verified**.

---

## 🛠 Support and Contributions

If you encounter issues or have suggestions, feel free to submit an issue or pull request on the GitHub repository:  
[HWTool GitHub](https://github.com/NammIsADev/hwtool)

---

## 🔧 Troubleshooting

Encountering issues while using HWTool? Don't panic. Here’s a detailed guide to help you resolve common problems:

---

### **1. Device Not Detected in Download Mode**
- **Symptoms:** Device doesn’t appear as **USB SER** or **Serial Port HUAWEI USB COM 1.0** in Device Manager.
- **Solutions:**
  - Check that you’re using a high-quality USB cable—poor-quality cables can cause connection issues.
  - Verify that the testpoint is correctly shorted. If unsure, revisit guides specific to your device model.
  - Ensure that conductive tweezers or tools are used for shorting the testpoint. Non-conductive materials won’t work.
  - Try a different USB port or computer to rule out hardware compatibility issues.
  - Reboot the device and repeat the steps, ensuring all drivers (HiSuite, Huawei Testpoint Drivers) are installed.

---

### **2. Device Manager Displays as "Unknown Device"**
- **Symptoms:** Your device is detected as **Unknown Device** instead of USB SER or Serial Port.
- **Solutions:**
  - Install Huawei Testpoint Drivers if they aren’t installed already.
  - Verify that HiSuite is correctly installed—sometimes, HiSuite can automatically resolve driver conflicts.
  - Uninstall the "Unknown Device" driver via Device Manager, then reconnect your device to reinstall drivers.
  - Check for device-specific drivers online and install them manually.

---

### **3. Bootloader Unlock Fails**
- **Symptoms:** The unlock process fails, or an error appears during the procedure.
- **Solutions:**
  - Ensure you’ve correctly followed disassembly steps, especially accessing the testpoint.
  - Verify your device is supported by HWTool. If not sure, check the [Supported Devices List](https://github.com/NammIsADev/hwtool/blob/main/SUPPORT-DEVICES.md).
  - Double-check that PotatoNV is installed and configured properly.
  - Retry the process using the latest PotatoNV version available on GitHub.
  - Check your EMUI version—HWTool works best on EMUI 8 and EMUI 9. EMUI 10 or later may not be compatible.

---

### **4. Fastboot/ADB Commands Fail**
- **Symptoms:** Fastboot or ADB commands don’t execute or fail midway.
- **Solutions:**
  - Ensure ADB is installed and added to your system PATH variable.
  - Restart your computer and device, then reattempt the procedure.
  - Use the command `adb devices` to check if your device is detected. If not, verify your USB connection and driver installation.
  - For Fastboot errors, use the command `fastboot devices` to confirm detection.
  - If errors persist, reinstall ADB/Fastboot tools from official Android SDK resources.

---

### **5. TWRP or ROM Flashing Fails**
- **Symptoms:** TWRP recovery or custom ROM installation doesn’t succeed.
- **Solutions:**
  - Verify you’re using the correct ROM or recovery files for your device model.
  - Double-check your partition selection in Fastboot—incorrect partitions can lead to flashing errors.
  - Ensure the ROM file is fully downloaded and not corrupted. If necessary, re-download the file.
  - Reboot into Fastboot mode and try flashing again.
  - If you’re using TWRP, ensure it’s compatible with your device and EMUI version.

---

### **6. Testpoint is Difficult to Access**
- **Symptoms:** You’re unable to locate or safely short the testpoint on your device’s motherboard.
- **Solutions:**
  - Refer to detailed video guides for your device model—these often include step-by-step visuals.
  - Use a magnifying glass or similar tool to pinpoint the exact testpoint location.
  - Be cautious when handling planar cables or other fragile components during disassembly.
  - If disassembly proves too challenging, consider using paid software that supports "software testpoint."

---

## 📄 License

HWTool is open-source and licensed under the [MIT License](https://github.com/NammIsADev/hwtool/blob/main/LICENSE).

---

## 🙏 Credits

The development and success of HWTool are supported by a combination of helpful tools, resources, and research efforts:

- **Notepad++:** For script creation and editing.
- **ADB & Fastboot:** For device communication and system management.
- **PotatoNV:** The bootloader unlock utility for Huawei devices.
- **Google & YouTube:** Essential for researching testpoint locations, device compatibility, and finding tutorials.

These resources have played a vital role in ensuring HWTool simplifies the unlocking and customization processes for Huawei devices.

---

# Enjoy customizing your Huawei device with HWTool!
