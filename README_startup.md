# 🚀 PowerShell Startup Program Inventory

This PowerShell script collects all startup programs from the Windows Registry and the user's Startup folder, and exports them to a CSV file.

## 🧰 Features

- Scans startup locations:
  - `HKLM:\...\Run`
  - `HKCU:\...\Run`
  - Startup folder (`shell:startup`)
- Combines results into one list
- Saves as `startup_programs.csv` on the Desktop
- Great for detecting persistence, performance issues, or audit trails

## 🚀 How to Use

1. Open PowerShell as Administrator
2. Navigate to the script's location
3. Run:

```powershell
./startup_inventory.ps1
```

Your report will be saved to the Desktop as `startup_programs.csv`.

## 💡 Example Output

| Location       | Name        | Path                                      |
|----------------|-------------|-------------------------------------------|
| HKLM:Run       | WindowsDef  | C:\Program Files\Windows Defender\def.exe |
| HKCU:Run       | Discord     | C:\Users\Wiley\AppData\Local\Discord\Update.exe |
| Startup Folder | openvpn-gui | C:\Users\Wiley\Start Menu\Programs\Startup\openvpn-gui.lnk |

## 📁 Files

- `startup_inventory.ps1`: The main script
- `example_output.txt`: Sample CSV output

---
