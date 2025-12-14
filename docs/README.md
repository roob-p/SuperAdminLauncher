<!--[🔙 Back](https://roob-p.github.io)--> 
<!--[![🔙 Back](https://img.shields.io/badge/🔙-Back-blue)](https://roob-p.github.io)-->
[![🔙 Back](https://img.shields.io/badge/🔙-Back-white?style=flat-square&logoColor=blue&color=blue)](https://roob-p.github.io)
# 🚀 Super Admin Launcher (SAL)
*Launch anything. No UAC prompts.*

✨ This utility lets you launch any programs with elevated privileges without triggering any UAC prompts.
Simply select your files, press the hotkeys, and they run as admin automatically.

## How it works:
- The script intercepts the files you select with the keyboard or mouse.
- When you press the hotkeys, it triggers the `SuperAdminLauncher` task, which runs `Launcher.exe` with admin rights. This program will execute the selected files with elevated privileges. No UAC prompts.
- Select multiple files at once by holding `ctrl`.
- Default hotkeys:
  - `Win`+`Alt`+`Left Mouseclick`
  - `Win`+`Alt`+`R` 
- You can change the hotkeys in `config.ini`. Avoid keys like `ctrl` (already used by windows for multiple selections) and `shift` (also used for file selections).
 You can find the hexadecimal values for the keys here: [Values Table](./Values%20Table.md) or [Microsoft Virtual Key Codes](https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes)
- `Super Admin Launcher Resident` is the tray-resident script.
- `Super Admin Launcher Container` allows you to launch programs by dragging and dropping files onto it. You can find it on desktop.
- You can also use `Super Admin Launcher` by a `(non admin) command prompt`:
  - Type `sal <filename>` (absolute path is resolved automatically).
  - Or drag & drop a file into the `command prompt` after typing `sal`

If you enjoy this utility, you can buy me a coffee. It will be appreciated. 

  [![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/roobp)  


- Github repo 🐙: [roob-p/SuperAdminLauncher](https://github.com/roob-p/SuperAdminLauncher)
- Download last version:
  [v1.0.1_x64](https://github.com/roob-p/SuperAdminLauncher/releases/download/v1.0.1/SuperAdminLauncher.Installer_x64.exe)
  [v1.0.1_x86](https://github.com/roob-p/SuperAdminLauncher/releases/download/v1.0.1/SuperAdminLauncher.Installer_x86.exe)




## ⚠️ Warning
This utility is very simple but powerful. It bypasses the UAC prompts, so only run files you trust and avoid using on downloaded files without verifying them. Misuse can compromise your system. Use responsibly.

<br>

### 🎖️ Credits
This utility uses the `GetIShellBrowser()`, `GetShellInterfaces()`and `GetFiles()` functions from `FileExplorer and Desktop` au3 files of **LarsJ** [https://www.autoitscript.com/forum/topic/203313-automating-filewindows-explorer-and-desktop](https://www.autoitscript.com/forum/topic/203313-automating-filewindows-explorer-and-desktop) to determine which files are selected.

<br>

<table style="width: 100%; border-collapse: collapse; text-align: center;">
  <tr>
    <td style="padding: 5px; vertical-align: top;">
      <img src="https://raw.githubusercontent.com/roob-p/SuperAdminLauncher/main/media/sal%201b.gif" style="width: 600px; height: auto;" />
    </td>
  </tr>
  <tr>
    <td style="padding: 5px; vertical-align: top;">
      <img src="https://raw.githubusercontent.com/roob-p/SuperAdminLauncher/main/media/sal%202.gif" style="width: 600px; height: auto;" />
    </td>
  </tr>
  <tr>
    <td style="padding: 5px; vertical-align: top;">
      <img src="https://raw.githubusercontent.com/roob-p/SuperAdminLauncher/main/media/sal%203.gif" style="width: 600px; height: auto;" />
    </td>
  </tr>
</table>

