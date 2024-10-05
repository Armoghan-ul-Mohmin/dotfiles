menu(mode="multiple" title='&Develop' sep=sep.bottom image=\uE26E)
{
    item(title='LazyGit' image=inherit cmd='lazygit')
    item(title='Git Bash' image=\uE12E cmd='C:\Program Files\Git\git-bash.exe')
    separator
    
    menu(mode="multiple" title='npm' image=\uE1F6)
    {
        item(title='install' cmd-line='/K npm install' image=\uE16D)
        item(title='start' cmd-line='/K npm start')
        item(title='run build' cmd-line='/K npm run build')
        separator
        item(title='run lint' cmd-line='/K npm run lint')
        item(title='run serve' cmd-line='/K npm run serve')
        item(title='run watch' cmd-line='/K npm run watch')
        separator
        item(title='view outdated' cmd-line='/K npm outdated')
        item(title='view list' cmd-line='/K npm list')
    }
    
    menu(mode="multiple" title='Hugo' image=\uE1F6)
    {
        item(title='new site' cmd-line='/K hugo new site my-site')
        item(title='server' cmd-line='/K hugo server' image=\uE2B9)
        item(title='new post' cmd-line='/K hugo new post "My New Post.md"')
        item(title='build' cmd-line='/K hugo build')
    }
    
    menu(mode="multiple" title='Run Files' image=\uE1F6)
    {
        item(title='Run Python File' cmd-line='/K python "@sel.path"') 
        item(title='Run Node.js File' cmd-line='/K node "@sel.path"')  
        item(title='Run Bash Script' cmd-line='/K bash "@sel.path"')
        item(title='Run PowerShell Script' cmd-line='/K powershell.exe -ExecutionPolicy Bypass -File "@sel.path"')
    }
    
}