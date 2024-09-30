# ===================== Profile Initialization =====================
"Profile loaded at $(Get-Date)" | Out-File -Append "$env:USERPROFILE\profile-load.log"
# ===================================================================== #


# ===================== Import Necessary Modules =====================
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
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'   # Use Ctrl+r for reverse history navigation
# ===================================================================== #


# ===================== Initialize Starship =====================
starship init powershell | Out-String | Invoke-Expression 
# ===================================================================== #


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


# ===================== Compute File Hashes Aliases =====================
function md5 { Get-FileHash -Algorithm MD5 $args }       # MD5 hash
function sha1 { Get-FileHash -Algorithm SHA1 $args }     # SHA1 hash
function sha256 { Get-FileHash -Algorithm SHA256 $args } # SHA256 hash
# ===================================================================== #


# ===================== Common Aliases =====================
# Set up aliases for commonly used commands
Set-Alias cat bat.exe                                                           # Use 'cat' for bat (a better cat command)
Set-Alias which Get-Command                                                     # Use 'which' to find commands
Set-Alias h Get-History                                                         # Use 'h' to get command history
Set-Alias grep Select-String                                                    # Use 'grep' to search strings
Set-Alias lg lazygit.exe                                                        # Launch LazyGit
Set-Alias htop ntop.exe                                                         # Launch Htop 

# Networking
function ip { curl ipinfo.io/ip }      # Get your public IP address
# ===================================================================== #


# ===================== Distrobox Aliases Using WSL =====================
function gui { wsl -d kali-linux kex --win -s }     # Winkex GUI for Kali Linux
function arch { wsl distrobox enter arch }          # Open Arch Distrobox Container
function fedora { wsl distrobox enter fedora }      # Open Fedora Distrobox Container
function alpine { wsl distrobox enter alpine }      # Open Alpine Distrobox Container
# ===================================================================== #


# ========================= Custom Functions ========================= #
# Function to copy file content to the clipboard
function Copy-FileToClipboard {
    param (
        [Parameter(Mandatory = $true)]
        [string]$FilePath
    )

    if (Test-Path $FilePath) {
        Get-Content $FilePath | Set-Clipboard
        Write-Host "✅ Content copied to clipboard from $FilePath" -ForegroundColor Green
    }
    else {
        Write-Host "❌ File not found: $FilePath" -ForegroundColor Red
    }
}

# Function to edit a file with a chosen editor
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
# Initialize zoxide in PowerShell for autojump functionality
Invoke-Expression -Command ($(zoxide init powershell) -join "`n")

# Alias 'j' to 'zoxide' for easy navigation
Set-Alias j z
# ================================================================== #


# ===================== Clear Console and Display Info =====================
Clear-Host                                                   # Clear the console
winfetch.ps1                                                 # Display system information using winfetch
# ===================================================================== #
