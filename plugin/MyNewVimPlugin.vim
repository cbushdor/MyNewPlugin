" ------------------------------------------------------
" Created By : sdo
" File Name : MyNewVimPlugin.vim
" Creation Date : 2024-04-18 01:45:45
" Last Modified : 2024-05-21 20:31:59
" Email Address : cbushdor@laposte.net
" Version : 0.0.0.600
" License : 
" 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
" 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
" Purpose :
"  Only works if file *.txt olnly for test purpose
" 	>breakadd function TryColors
" ------------------------------------------------------

function s:removeStackStringColor(obj)
   try
      let l:elem = a:obj.removeStackStringColor()
      echo "Reached " .. string(a:obj.checks_prints_and_prompts()) .. "\n"
      echo "Element removed from stack "..string(l:elem).."\n"
   catch /Stack is empty.*/
      echo "Error catched: "..v:exception
      call l:obj.addStackStringColor(
               \ 	[
               \ 		"We enter new string when exception catched " .. v:exception .. "\n",
               \ 		':hi MyColor  term=bold ctermfg=DarkBlue guifg=#80a0ff gui=bold',
               \ 		g:func_print_col.MACOLIB_PRINT
               \ 	])
   endtry
endfunction

function s:clearStringColor(obj)
   try
      return a:obj.clearStringColor()
   catch /Nothing to clean.*/
      echo "Error catched: "..v:exception
   endtry
endfunction

function! TryColors(...)
   try
      "throw "Stoping()"
      " Read when in vim 
      " :help :highlight

      " \               ["Test french touch\n",":hi comment ctermfg=darkgrey ctermbg=darkblue",g:func_print_col.MACOLIB_PRINT],

      let l:obj = MaCoLib#new(
               \ 132,
               \           [
               \               ["Another test ",":hi comment ctermfg=grey ctermbg=darkblue",g:func_print_col.MACOLIB_PRINT],
               \               ["Hello everybody Brown ", ':hi MyColor  term=underline ctermfg=Brown guifg=#80a0ff',g:func_print_col.MACOLIB_PRINT],
               \               ["Hello everybody DarkGrey ", ':hi MyNewColor  term=italic ctermfg=DarkGrey guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT],
               \               ["Hello everybody Gray ", ':hi MyAddedColor  term=italic ctermfg=Gray guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT],
               \               ["Hello everybody LightBlue ", ':hi MyColor  term=italic ctermfg=LightBlue guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT],
               \               ["Hello everybody Blue ", ':hi MyColor  term=italic ctermfg=Blue guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT],
               \               ["HeLLo everybody DarkBlue ", ':hi MyColor  term=italic ctermfg=DarkBlue guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT],
               \               ["HeLLo everybody another print DarkRed ", ':hi MyColor  term=italic ctermfg=DarkRed guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT ],
               \               ["HeLLo everybody another print Red ", ':hi MyColor  term=italic ctermfg=Red guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT ],
               \               ["HeLLo everybody another prompt Red ", ':hi MyColor  term=italic ctermfg=Red guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT ],
               \               ["HeLLo everybody another print Red ", ':hi MyColor  term=italic ctermfg=Red guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT ],
               \               ["HeLLo everybody another print Red ", ':hi MyColor  term=italic ctermfg=Red guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT ],
               \               ["HeLLo everybody another print DarkRed\n", ':hi MyColor  term=italic ctermfg=DarkRed guifg=#80a0ff gui=bold',g:func_print_col.MACOLIB_PRINT ],
               \               ["Hello everybody DarkYellow\n", ':highlight MyColor ctermfg=darkgreen guifg=darkgreen',g:func_print_col.MACOLIB_PRINT]
               \           ]
               \)
      call l:obj.addStackStringColor(
               \ 	[
               \ 		"Hello from l:obj.addStackStringColor",
               \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
               \ 		g:func_print_col.MACOLIB_PRINT
               \ 	])
      call l:obj.addHeapStringColor(
               \ 	[
               \ 		"Hello from l:obj.addHeapStringColor\n",
               \ 		':hi MyColor  term=bold ctermfg=Yellow guifg=#80a0ff gui=bold',
               \ 		g:func_print_col.MACOLIB_PRINT
               \ 	])
      try
         echo l:obj.prints_and_prompts()
         echo l:obj.say()
         echo l:obj.prompt()
      catch /Nothing to prompt.*/
         echo "Error catched: "..v:exception
         echo "We print cause of error: " .. string(obj.checks_prints_and_prompts()).."\n"
         call l:obj.addStackStringColor(
                  \ 	[
                  \ 		"We add another prompt after error catched: " .. v:exception,
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         echo "Reached " .. string(obj.checks_prints_and_prompts()) .. "\n"
         echo l:obj.say()
         echo l:obj.prompt()
      finally
         echo "We continue"

         call s:clearStringColor(obj)
         call s:clearStringColor(obj)

         call l:obj.addStackStringColor(
                  \ 	[
                  \ 		"Exception/error catched ===> " .. v:exception ,
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         echo "Read stack values: " .. string(obj.checks_prints_and_prompts()) .. "\n"
         call s:removeStackStringColor(obj)
      endtry
      echo "\n\n****************\n"
      while (l:obj.isEmptyStackStringColor() != v:true)
         echo "\n\n**********************************************\n"
         let l:u = s:removeStackStringColor(obj)
      endwhile
   catch /MaCoLib:.*/
      echo "Error catch from catch MyNewVimPlugin: "..v:exception
   catch /MaCoLib1:.*/
      throw "We are the champion"
   endtry
endfunction

try
   " We call function TryColors() when BufNewFile.
   autocmd BufNewFile *.txt execute ":call TryColors()"

   " We call function TryColors() when BufReadFile.
   " Interruption managed here (first test see call Stop() bellow)
   autocmd BufRead *.txt execute "
            \:try
            \|    call TryColors()
            \|catch /.*/
            \|    echo \"Stopping due to \" .. v:exception .. \"\n\"
            \|    call Stop() 
            \|endtry"
catch /.*/
   echo "errrrrrr"
endtry
