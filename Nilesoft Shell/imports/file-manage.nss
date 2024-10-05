menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='File Manage' image=\uE253)
{
    menu(separator="after" image=\uE290 title=title.select)
    {
        item(title="All" image=icon.select_all cmd=command.select_all)
        item(title="Invert" image=icon.invert_selection cmd=command.invert_selection)
        item(title="None" image=icon.select_none cmd=command.select_none)
    }
    
    item(type='file|dir|back.dir|drive' title='Take Ownership' image=[\uE194,#f00] admin
        cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
    separator
    menu(title="Show/Hide" image=icon.show_hidden_files)
    {
        item(title="System files" image=inherit cmd='@command.togglehidden')
        item(title="File name extensions" image=icon.show_file_extensions cmd='@command.toggleext')
    }
    
    menu(type='file|dir|back.dir' mode="single" title='Attributes')
    {
        $atrr = io.attributes(sel.path)
        item(title='Hidden' checked=io.attribute.hidden(atrr)
            cmd args='/c ATTRIB @if(io.attribute.hidden(atrr),"-","+")H "@sel.path"' window=hidden)
        
        item(title='System' checked=io.attribute.system(atrr)
            cmd args='/c ATTRIB @if(io.attribute.system(atrr),"-","+")S "@sel.path"' window=hidden)
        
        item(title='Read-Only' checked=io.attribute.readonly(atrr)
            cmd args='/c ATTRIB @if(io.attribute.readonly(atrr),"-","+")R "@sel.path"' window=hidden)
        
        item(title='Archive' checked=io.attribute.archive(atrr)
            cmd args='/c ATTRIB @if(io.attribute.archive(atrr),"-","+")A "@sel.path"' window=hidden)
        separator
        item(title="CREATED" keys=io.dt.created(sel.path, 'y/m/d') cmd=io.dt.created(sel.path,2000,1,1))
        item(title="MODIFIED" keys=io.dt.modified(sel.path, 'y/m/d') cmd=io.dt.modified(sel.path,2000,1,1))
        item(title="ACCESSED" keys=io.dt.accessed(sel.path, 'y/m/d') cmd=io.dt.accessed(sel.path,2000,1,1))
    }
}