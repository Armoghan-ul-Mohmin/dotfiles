# ===================== Profile Initialization =====================
# Log the time the profile was loaded for debugging purposes
"Profile loaded at $(Get-Date)" | Out-File -Append "$env:USERPROFILE\profile-load.log"
# ===================================================================== #

# ===================== Import Necessary Modules =====================
# Import modules for enhanced terminal functionality
Import-Module posh-git                              # Provides Git status information in the prompt
Import-Module -Name Terminal-Icons                  # Adds icons to the terminal for better visuals
Import-Module -Name Microsoft.PowerShell.Archive    # Enables commands for working with archive files
Import-Module PSWeb                                 # Provides web-related cmdlets
Import-Module -Name PSFzf                           # Enables fuzzy finding capabilities in PowerShell
Import-Module PSReadLine                            # Enhances command line editing, history, and completion
Import-Module Microsoft.WinGet.CommandNotFound      # Provides suggestions for commands that are not found
# ===================================================================== #


# ===================== Configure PSFzf Options =====================
Set-PsFzfOption -PSReadlineChordProvider 'Alt+f'         # Use Alt+f for fuzzy finding
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'   # Use Alt+h to reverse history navigation
# ===================================================================== #

# ===================== Initialize Starship =====================
starship init powershell | Out-String | Invoke-Expression 

# ===================== Configure PSReadline =====================
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete            # Changes the Tab key to show completion options
Set-PSReadLineKeyHandler -Chord 'Ctrl+e' -ScriptBlock { Edit-File } # Bind Ctrl+E to the edit function
Set-PSReadlineOption -BellStyle None                                # Disable bell sound
Set-PSReadlineOption -HistoryNoDuplicates                           # Prevent duplicates in history
Set-PSReadlineOption -MaximumHistoryCount 1000                      # Set maximum history count
# ===================================================================== #

# ===================== Directory Navigation Aliases =====================
function .. { Set-Location .. }             # Go up one directory
function ... { Set-Location ../.. }         # Go up two directories
function .... { Set-Location ../../.. }     # Go up three directories
# ===================================================================== #

# ===================== Common Tool Aliases Using WSL =====================
function hugo { wsl hugo $args }                    # Alias for Hugo (static site generator)
function npm { wsl npm $args }                      # Alias for npm (Node package manager)
function python { wsl python3 $args }               # Alias for Python (Python 3)
function pip { wsl pip $args }                      # Alias for pip (Python package manager)
function gui { wsl -d kali-linux kex --win -s }     # Winkex Gui 
function arch { wsl distrobox enter arch }          # Open Arch Distrobox Container
function fedora { wsl distrobox enter fedora }      # Open Fedora Distrobox Container
function alpine { wsl distrobox enter alpine }      # Open Alpine Distrobox Container
# ===================================================================== #

# ========================= Custom Functions ========================== #
function Copy-FileToClipboard{
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    if (Test-Path $FilePath) {
        Get-Content $FilePath | Set-Clipboard
        Write-Host "✅ Content copied to clipboard from $FilePath" -ForegroundColor Green
    } else {
        Write-Host "❌ File not found: $FilePath" -ForegroundColor Red
    }
}

function Edit-File {
    param (
        [string]$Directory = "."
    )

    # Exclude specific directories and find files
    $files = Get-ChildItem -Path $Directory -Recurse -File -Exclude '.git', 'node_modules', 'vendor' | 
    Where-Object { $_.PSIsContainer -eq $false } |
    Select-Object -ExpandProperty FullName

    # Use fzf to select a file
    $selectedFile = $files | fzf --preview 'powershell -Command "Get-Content {}"' `
    --preview-window=right:55% `
    --header='🎉  Select a file to edit  🎉' `
    --border `
    --reverse `
    --height=95% `
    --prompt='🔍  '

    if ($selectedFile) {
        $editorChoice = $null
            Write-Host "`nChoose an editor:`n1: Notepad`n2: Visual Studio Code`n" -ForegroundColor Cyan
            $editorChoice = Read-Host "Enter your choice: "
            switch ($editorChoice) {
                '1' {
                    notepad $selectedFile
                    exit
                }
                '2' {
                    code $selectedFile
                    exit
                }
                default {
                    Write-Host "❌ Invalid choice. Please choose 1, 2" -ForegroundColor Red
                    exit
                }
            }
    }
}
# ================================================================== #

# ================= Initialize zoxide and Add Alias =================
# Initialize zoxide in PowerShell
Invoke-Expression -Command ($(zoxide init powershell) -join "`n")

# Alias 'j' to 'zoxide' for autojump functionality
Set-Alias j z
# ================================================================== #

cls

winfetch