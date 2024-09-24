# ===================== Profile Initialization =====================
# Log the time the profile was loaded for debugging purposes
"Profile loaded at $(Get-Date)" | Out-File -Append "$env:USERPROFILE\profile-load.log"
# ===================================================================== #

# ===================== Import Necessary Modules =====================
# Import modules for enhanced terminal functionality
Import-Module posh-git                     # Provides Git status information in the prompt
Import-Module -Name Terminal-Icons          # Adds icons to the terminal for better visuals
Import-Module -Name Microsoft.PowerShell.Archive  # Enables commands for working with archive files
Import-Module PSWeb                         # Provides web-related cmdlets
Import-Module -Name PSFzf                   # Enables fuzzy finding capabilities in PowerShell
# ===================================================================== #

# ===================== Configure PSFzf Options =====================
Set-PsFzfOption -PSReadlineChordProvider 'Alt+f'         # Use Alt+f for fuzzy finding
Set-PsFzfOption -PSReadlineChordReverseHistory 'Alt+h'   # Use Alt+h to reverse history navigation
# ===================================================================== #

# ===================== Initialize Starship =====================
starship init powershell | Out-String | Invoke-Expression 

# ===================== Configure PSReadline =====================
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete   # Changes the Tab key to show completion options
# ===================================================================== #

# ===================== Directory Navigation Aliases =====================
function .. { Set-Location .. }      # Go up one directory
function ... { Set-Location ../.. }   # Go up two directories
function .... { Set-Location ../../.. } # Go up three directories
# ===================================================================== #

# ===================== Common Tool Aliases Using WSL =====================
function hugo { wsl hugo $args }      # Alias for Hugo (static site generator)
function npm { wsl npm $args }        # Alias for npm (Node package manager)
function python { wsl python3 $args } # Alias for Python (Python 3)
function pip { wsl pip $args }        # Alias for pip (Python package manager)
function grep { wsl grep $args }      # Alias for grep (text search utility)
function vim { wsl nvim $args }       # Alias for Vim (Neovim)
function vi { wsl nvim $args }        # Alias for Vi (Neovim)
function nvim { wsl nvim $args }      # Alias for Neovim
function gui { wsl -d kali-linux kex --win -s } # Winkex Gui 
# ===================================================================== #
