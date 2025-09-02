# 🚀 Super Admin Launcher
*Launch anything. No UAC prompts.*

✨ This utility lets you launch any programs without triggering any UAC prompts.
Simply press the hotkeys and you're done.

## How it works:
- The script intercepts the files you select with the keyboard or mouse.
- When you press the hotkeys, it triggers the `SuperAdminLauncher` task, which runs `Launcher.exe` with admin rights. This program will execute the selected files with elevated privileges. No UAC prompts.
- Select multiple files at once by holding `ctrl`.
- Default hokeys:
  - `Win`+`ALT`+`left mouseclick`
  - `Win`+`ALT`+`r` 
- You can change the hotkeys in `config.ini`. Avoid keys like `ctrl` (already used by windows for multiple selections) and `shift` (also used for file selections).
 You can find the hexadecimal values for the keys here: https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
- `Super Admin Launcher Resident` is the tray-resident script.
- `Super Admin Launcher Container` allows you to launch programs by dragging and dropping files onto it. You can find it on desktop.
- You can also use `Super Admin Launcher` by a `(non admin) command prompt`:
  - Type `sal <filename>` (absolute path is resolved automatically).
  - Or drag & drop a file into the Command Prompt after typing `sal`




## ⚠️ Warning
This utility is very simple but powerful. Only run files you trust. Misuse can compromise your system.
