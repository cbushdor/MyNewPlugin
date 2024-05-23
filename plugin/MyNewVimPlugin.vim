" ------------------------------------------------------
" Created By : sdo
" File Name : MyNewVimPlugin.vim
" Creation Date : 2024-04-18 01:45:45
" Last Modified : 2024-05-23 04:41:47
" Email Address : cbushdor@laposte.net
" Version : 0.0.0.694
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
   endtry
endfunction

function s:addStackStringColor(obj,col)
   try
      echo "Adding: "..string(a:col).."\n"
      call a:obj.addStackStringColor(a:col)
   catch /Max size reached.*/
      echo "Error "..v:exception.."\n"
   catch /Error detected in the nuplet format:.*/
      echo v:exception.."\n"
   endtry
endfunction

function! s:checks_prints_and_prompts(obj)
   try
      return string(a:obj.checks_prints_and_prompts())
   catch /.*/
      echo "Error catched ".. v:exception.."\n"
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

      try
         let l:obj = MaCoLib#new(
                  \           24,
                  \           [
                  \               ["Hello color 1 Red [constructor]",":hi MyCommet1 ctermfg=Red ctermbg=darkblue",g:func_print_col.MACOLIB_PRINT],
                  \               ["Hello color 2 DarkYellow [constructor]", ':highlight MyColor ctermfg=darkgreen guifg=darkgreen',g:func_print_col.MACOLIB_PRINT]
                  \           ]
                  \)
         call s:checks_prints_and_prompts(l:obj)

         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 3 DarkRed [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=DarkRed guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 4 DarkBlue [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=DarkBlue guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 5 DarkYellow [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 5 LighRed [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=LightRed guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 6 LightYellow [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=LightYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 7 Red [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=Red guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"\nHello color 3 Red & Blue [obj.addStackStringColor()]\n==========\n\n",
                  \ 		':hi MyColor  term=bold guifg=Red guibg=Blue gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
         echo l:obj.prints_and_prompts()
      "   echo l:obj.say()
      "   echo l:obj.prompt()
      catch /Nothing to prompt.*/
         echo "Error catched: "..v:exception .. "\n"
         echo "We print cause of error: " .. string(l:obj.checks_prints_and_prompts()).."\n"
         echo "We fill stack...\n"
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"We add another prompt after error catched: " .. v:exception,
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         echo "Reached " .. string(obj.checks_prints_and_prompts()) .. "\n"
         echo l:obj.say()
         echo l:obj.prompt()
      finally
         echo "We continue before s:clearStringColor(obj)"

         if (s:clearStringColor(obj) == v:false)
            echo "-----> Stack not empty\n"
            call s:clearStringColor(obj)
         else
            echo "-----> Stack empty "..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
            call s:clearStringColor(l:obj)
         endif

         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Exception/error catched ===> " .. v:exception ,
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         echo "Read stack values: " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
         call s:removeStackStringColor(l:obj)
         call s:addStackStringColor(obj,
                  \ 	[
                  \ 		"We enter new string when exception catched " .. v:exception .. "\n",
                  \ 		':hi MyColor  term=bold ctermfg=DarkBlue guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
      endtry
      echo "\n********************\n"
      echo "***CLEANING STACK***\n"
      echo "********************\n"
      while (l:obj.isEmptyStackStringColor() != v:true)
         let l:u = s:removeStackStringColor(l:obj)
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
