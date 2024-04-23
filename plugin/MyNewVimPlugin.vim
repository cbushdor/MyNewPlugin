" ------------------------------------------------------
" Created By : sdo
" File Name : MyNewVimPlugin.vim
" Creation Date : 2024-04-18 01:45:45
" Last Modified : 2024-04-23 21:58:51
" Email Address : cbushdor@laposte.net
" Version : 0.0.0.393
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
" 	>breakadd function TryColors
" ------------------------------------------------------

function! TryColors(...)
   try
      " Read when in vim 
      " :help :highlight
      let l:obj = MaCoLib#new(
               \           [
               \               ["Another test\n",":hi comment ctermfg=grey ctermbg=darkblue",g:MACOLIB_PRINT],
               \               ["Hello everybody Brown\n", ':hi MyColor  term=underline ctermfg=Brown guifg=#80a0ff',g:MACOLIB_PRINT],
               \               ["Hello everybody DarkGrey\n", ':hi MyNewColor  term=italic ctermfg=DarkGrey guifg=#80a0ff gui=bold',g:MACOLIB_PRINT],
               \               ["Hello everybody Gray\n", ':hi MyAddedColor  term=italic ctermfg=Gray guifg=#80a0ff gui=bold',g:MACOLIB_PRINT],
               \               ["Hello everybody LightBlue\n", ':hi MyColor  term=italic ctermfg=LightBlue guifg=#80a0ff gui=bold',g:MACOLIB_PRINT],
               \               ["Hello everybody Blue\n", ':hi MyColor  term=italic ctermfg=Blue guifg=#80a0ff gui=bold',g:MACOLIB_PRINT],
               \               ["HeLLo everybody DarkBlue\n", ':hi MyColor  term=italic ctermfg=DarkBlue guifg=#80a0ff gui=bold',g:MACOLIB_PRINT],
               \               ["HeLLo everybody another prompt Red\n", ':hi MyColor  term=italic ctermfg=Red guifg=#80a0ff gui=bold',g:MACOLIB_PRINT ],
               \               ["HeLLo everybody another prompt DarkRed\n", ':hi MyColor  term=italic ctermfg=DarkRed guifg=#80a0ff gui=bold',g:MACOLIB_PRINT ],
               \               ["Hello everybody DarkYellow\n", ':highlight MyColor ctermfg=darkgreen guifg=darkgreen',g:MACOLIB_PRINT]
               \           ],
               \)
      "echo l:obj.prints_and_prompts()
      "echo "\n\niiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii\n"
      call l:obj.addStackStringColor(
               \ 	[
               \ 		"Hello from l:obj.addStackStringColor\n",
               \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
               \ 		g:MACOLIB_PRINT
               \ 	])
      "echo l:obj.prints_and_prompts()
      echo "\n\nkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk\n"
      call l:obj.addHeapStringColor(
               \ 	[
               \ 		"Hello from l:obj.addHeapStringColor\n",
               \ 		':hi MyColor  term=bold ctermfg=Yellow guifg=#80a0ff gui=bold',
               \ 		g:MACOLIB_PRINT
               \ 	])
      echo l:obj.prints_and_prompts()
      while (l:obj.isEmptyStackStringColor() != v:true)
         echo "\n\n*************************************************\n"
         let l:u = l:obj.removeStackStringColor()
         echo "\n\nThis was removed from staack: "..string(l:u).."\n"
         echo l:obj.prints_and_prompts()
      endwhile
   catch /MaCoLib:.*/
      echo "Error catch from catch MyNewVimPlugin: "..v:exception
   catch /MaCoLib1:.*/
      throw "We are the champion"
   endtry
endfunction

" We call function TryColors() when BufNewFile.
autocmd BufNewFile * execute ":call TryColors()"
try
   " We call function TryColors() when BufReadFile.
   autocmd BufRead * execute "
            \:try
            \|    call TryColors()
            \|catch /.*/
            \|    echo \"stopping due to \" .. v:exception .. \"\n\"
            \|    call Stop()
            \|endtry"
catch /.*/
   echo "errrrrrr"
endtry
