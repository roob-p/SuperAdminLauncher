# Super Admin Launcher
*Launch anything. No UAC prompts.*

✨ This utility lets you launch any programs without triggering any UAC prompts.
Just press the shortcuts and you're done.

## How it works:
- The script intercept the files selected with the keyboard or mouse, then entering the Shortkeys executes the `Super Admin Launcher`, wich runs the selected files with elevated privileges. Zero Uac prompts.
- You can choose multiple files at once pressing `ctrl`.
- Press `Win`+`ALT`+`left mouseclick` or `Win`+`ALT`+`r` to launch the files. 
- You can edit the default shortkeys opening `config.ini`, but keep in mind that is better to avoid some keys like `ctrl` (used by windows for multiple selections) and `shift`.
- You can find the hexadecimal values for the keys here: https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
- `Super Admin Launcher Resident` is the "resident" script in the tray. On Desktop you can find `Super Admin Launcher Container`. It's meant to execute the programs just by drag them to it.
- You can launch any exe|lnk etc. also with non admin command prompt. Just write `sal` and the file to run (the absolute path will be calculated). You can also drag it to the command prompt.   




## ⚠️ Warning
This utility is very simple but powerful. Don't use on any downloaded files, use it with consciousness. 
