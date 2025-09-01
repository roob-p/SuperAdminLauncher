# 🚀 Super Admin Launcher
*Launch anything. No UAC prompts.*

✨ This utility lets you launch any programs without triggering any UAC prompts.
Just press the shortcuts and you're done.

## How it works:
- The script intercept the files selected with the keyboard or mouse. When you press the Hotkeys it executes the `SuperAdminLauncher` task, wich runs the selected files with elevated privileges. No Uac prompts.
- You can choose multiple files at once pressing `ctrl`.
- Default Hokeys:
  - `Win`+`ALT`+`left mouseclick`
  - `Win`+`ALT`+`r` to launch the files. 
- You can change the Hotkeys in `config.ini`. Keep in mind that is better to avoid some keys like `ctrl` (already used by windows for multiple selections) and `shift`.
- You can find the hexadecimal values for the keys here: https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
- `Super Admin Launcher Resident` is the tray-resident script. On Desktop you can find `Super Admin Launcher Container`. It's meant to execute the programs just by drag them to it.
- You can also use `Super Admin Launcher` by a (non admin) command prompt:
  - Type `sal <filename>` (absolute path is resolved automatically). You can also drag it to the command prompt.
  - Or drag & drop a file into the Command Prompt after typing `sal`




## ⚠️ Warning
This utility is very simple but powerful. Don't use on any downloaded files, use it with consciousness. 
