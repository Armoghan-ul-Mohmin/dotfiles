menu(type='*' where=window.is_taskbar||sel.count mode=mode.multiple title=title.go_to sep=sep.both image=\uE14A)
{
    item(title='Downloads' cmd=user.downloads)
    item(title='Pictures' cmd=user.pictures)
    item(title='Documents' cmd=user.documents)
    item(title='Profile' cmd=user.dir)
    item(title='Github' cmd=`C:\Windows\explorer.exe` arg=`"F:\Github"`)
    item(title='XAMPP Htdocs' cmd=`C:\Windows\explorer.exe` arg=`"F:\Xampp-htdocs"`)
    item(title=title.control_panel cmd='shell:::{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}')
}