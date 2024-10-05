menu(type='*' where=(sel.count or wnd.is_taskbar or wnd.is_edit) title=title.terminal sep=sep.top image=icon.run_with_powershell)
	{
		$tip_run_admin=["\xE1A7 Press SHIFT key to run " + this.title + " as administrator", tip.warning, 1.0]
		$has_admin=key.shift() or key.rbutton()
		
		// Command Prompt entry
		item(title=title.command_prompt tip=tip_run_admin admin=has_admin image cmd-prompt=`/K TITLE Command Prompt &ver& PUSHD "@sel.dir"`)
		
		// Windows Terminal entry
		item(where=package.exists("WindowsTerminal") title=title.Windows_Terminal tip=tip_run_admin admin=has_admin image='@package.path("WindowsTerminal")\WindowsTerminal.exe' cmd="wt.exe" arg=`-d "@sel.path\."`)
		
		// WSL
		item(title="Open in Kali Linux" image='%USERPROFILE%\OneDrive\Pictures\Icons\Kali.png' cmd="wt.exe" arg='-d "@sel.path\." -- wsl')
		
		
		// WSL Distrobox Arch
		item(title="Open in Arch" image='%USERPROFILE%\OneDrive\Pictures\Icons\Arch.ico' cmd="wt.exe" arg=`-d "@sel.path\." -- wsl -e distrobox enter arch`)
		
		// WSL Distrobox Fedora
		item(title="Open in Fedora" image='%USERPROFILE%\OneDrive\Pictures\Icons\Fedora.ico' cmd="wt.exe" arg=`-d "@sel.path\." -- wsl -e distrobox enter fedora`)
		
		// WSL Distrobox Alpine
		item(title="Open in Alpine" image='%USERPROFILE%\OneDrive\Pictures\Icons\Alpine.ico' cmd="wt.exe" arg=`-d "@sel.path\." -- wsl -e distrobox enter alpine`)
		
	}