 " window size
 if has("win32")
     au GUIEnter * simalt ~x
 else
     set transparency=8
     au GUIEnter * set lines=60
     au GUIEnter * set columns=190
 endif

set guifont=Monaco:h14
set showtabline=2
set mouse=a
