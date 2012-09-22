
" Add this to your $HOME/.ctags or $HOME/ctags.cnf:
"   --langdef=ant
"   --langmap=ant:.xml
"   --regex-ant=/^[ \t]*<project.+name="([^"]+)"/\1/p,project/
"   --regex-ant=/^[ \t]*<target.+name="([^"]+)"/\1/t,target/
"   --regex-ant=/^[ \t]*<[ \t]*[a-zA-Z0-9_-]+.* +id="([^"]+)"/\1/i,ids/

let g:tlist_ant_settings="ant;p:Project;t:Target;i:WithId"

compiler ant

