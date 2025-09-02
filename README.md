# 🚀 Super Admin Launcher
*Launch anything. No UAC prompts.*

✨ This utility lets you launch any programs without triggering any UAC prompts.
Just press the shortcuts and you're done.

## How it works:
- The script intercepts the files you select with the keyboard or mouse.
- When you press the hotkeys, it triggers the `SuperAdminLauncher` task, which runs `Launcher.exe` with admin rights. This program will execute the selected files with elevated privileges. No UAC prompts.
- You can choose multiple files at once pressing `ctrl`.
- Default hokeys:
  - `Win`+`ALT`+`left mouseclick`
  - `Win`+`ALT`+`r` 
- You can change the hotkeys in `config.ini`. Avoid keys like `ctrl` (already used by windows for multiple selections) and `shift` (also used for file selections).
 You can find the hexadecimal values for the keys here: https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
- `Super Admin Launcher Resident` is the tray-resident script.
- `Super Admin Launcher Container` it's meant to execute the programs just by drag them to it. You can find it on desktop.
- You can also use `Super Admin Launcher` by a `(non admin) command prompt`:
  - Type `sal <filename>` (absolute path is resolved automatically).
  - Or drag & drop a file into the Command Prompt after typing `sal`




## ⚠️ Warning
This utility is very simple but powerful. Don't use on any downloaded files, use it with consciousness. 
