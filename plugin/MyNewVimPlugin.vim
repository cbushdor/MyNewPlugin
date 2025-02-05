" ------------------------------------------------------
" Created By : sdo
" File Name : MyNewVimPlugin.vim
" Creation Date : 2024-04-18 01:45:45
" Last Modified : 2025-02-05 00:58:31
" Email Address : cbushdor@laposte.net
" Version : 0.0.0.909
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
               "call func()
      echo "4 Error catched: "..v:exception
   endtry
endfunction

function s:addStackStringColor(obj,col)
   try
      echo "Adding: "..string(a:col).."\n"
      call a:obj.addStackStringColor(a:col)
   catch /Max size reached.*/
      "echo "Error "..v:exception.."\n"
      throw v:exception
   catch /Error detected in the nuplet format:.*/
      echo v:exception .. "\n"
   endtry
endfunction

function! s:checks_prints_and_prompts(obj)
   try
      return string(a:obj.checks_prints_and_prompts())
   catch /.*/
               "call func()
      echo "1 Error catched ".. v:exception.."\n"
   endtry
endfunction

function s:clearStringColor(obj)
   try
      echo "IIII***********************>We try to clean the stack...\n"
      let l:path = expand('<script>')
      let l:path = split(l:path,'/')[len(split(l:path,'/'))-1] 
      " let l:path = substitute(l:path,'\..*$','','')
      return a:obj.clearStringColor()
   catch /Nothing to clean.*/
      echo "2 Error catched: " .. v:exception
   endtry
endfunction

function! TryColors(...)
   try
      "throw "Stoping()"
      " Read when in vim 
      " :help :highlight

      try
         let l:obj = MaCoLib#new(
                  \           14,
                  \           [
                  \               ["Hello color 1 Red [constructor]",":hi MyCommet1 ctermfg=Red ctermbg=darkblue",g:func_print_col.MACOLIB_PRINT],
                  \               ["Hello color 2 DarkYellow [constructor]", ':highlight MyColor ctermfg=darkgreen guifg=darkgreen',"MACOLIB_PROMPT"],
                  \               ["Hello color 3 Red [constructor]",":hi MyCommet1 ctermfg=Red ctermbg=darkblue",g:func_print_col.MACOLIB_PRINT],
                  \               ["Hello color 4 DarkYellow [constructor]", ':highlight MyColor ctermfg=darkgreen guifg=darkgreen',"MACOLIB_PRINT"]
                  \           ]
                  \)
         " We summup what's in stack!
         call s:checks_prints_and_prompts(l:obj)

         " We add info in stack
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 3 DarkRed [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=DarkRed guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         " We add info in stack
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 4 DarkBlue [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=DarkBlue guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])

         " We add info in stack
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 5 DarkYellow [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])

         " We add info in stack
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 5 LighRed [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=LightRed guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])

         " We add info in stack
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 6 LightYellow [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=LightYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])

         " We add info in stack
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Hello color 7 Red [obj.addStackStringColor()]",
                  \ 		':hi MyColor  term=bold ctermfg=Red guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])

         " We add info in stack
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"\nHello color 3 Red & Blue [obj.addStackStringColor()]\n==========\n\n",
                  \ 		':hi MyColor  term=bold guifg=Red guibg=Blue gui=bold',
                  \ 		g:func_print_col.MACOLIB_PRINT
                  \ 	])
         echo "::::::::>" .. string(l:obj.prints_and_prompts())
      "   echo l:obj.say()
      "   echo l:obj.prompt()
      catch /Nothing to prompt.*/
         echo "3 Error catched: "..v:exception .. "\n"
         echo "We print cause of error: " .. string(l:obj.checks_prints_and_prompts()).."\n"
         echo "We fill stack...\n"
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"We add another prompt after error catched: " .. v:exception,
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         echo "Reached " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
         echo l:obj.say()
         echo l:obj.prompt()
      catch /Key not present in Dictionary:.*/
         echo "Error with dictionary "..v:exception .. "<------\n"
      finally
         echo "We continue before s:clearStringColor(l:obj)"

         if obj.isEmptyStackStringColor() == v:true
            echo "\n\n\n========================>It is empty\n"..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
         else
            echo "\n\n\n========================>It is not empty here is its content\n"..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
         endif
         echo "********========>" .. line('.') .. "<++++++++++\n"
         if (s:clearStringColor(l:obj) == v:false)
            echo "-----> Stack not empty\n"
            call s:clearStringColor(obj)
         else
            echo "X-----> Stack empty "..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
            try
               echo "1IIIII********========>" .. line('.') .. "<++++++++++\n"
               "call func()
               echo "2IIIII********========>" .. line('.') .. "<++++++++++\n"
               call s:clearStringColor(l:obj)
            catch /.*/
            finally
               echo "Lets try to continue!!!!!"
               call s:addStackStringColor(l:obj,
                        \ 	[
                        \ 		"Exception/error catched ===> " .. v:exception ,
                        \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                        \ 		g:func_print_col.MACOLIB_PROMPT
                        \ 	])
               echo "Passed"
            endtry
         endif

         if l:obj.isEmptyStackStringColor() == v:true
            echo "\n\n\n========================>It is empty\n"..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
         else
            echo "\n\n\n========================>It is not empty here is its content\n"..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
         endif
         call s:addStackStringColor(l:obj,
                  \ 	[
                  \ 		"Exception/error catched ===> " .. v:exception ,
                  \ 		':hi MyColor  term=bold ctermfg=DarkYellow guifg=#80a0ff gui=bold',
                  \ 		g:func_print_col.MACOLIB_PROMPT
                  \ 	])
         if obj.isEmptyStackStringColor() == v:true
            echo "\n\n\n========================>It is empty\n"..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
         else
            echo "\n\n\n========================>It is not empty here is its content\n"..
                     \         string(l:obj.checks_prints_and_prompts()).."\n"
         endif
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
      echo "*===============================================================*\n"
      echo "* TESTS REGARDING STACKS ARE OVER BUT THEY WILL RETURN SOON     *\n"
      echo "* NOW PROCEDURE FOR TESTING HEAP                                *\n"
      echo "*===============================================================*\n"
      try
         let i = 0
         while i < 40
            call l:obj.addHeapStringColor(
                     \ [
                     \ 		i .. ". We enter new string when HEAP tested\n",
                     \ 		':hi MyColor  term=bold ctermfg=DarkBlue guifg=#80a0ff gui=bold',
                     \ 		g:func_print_col.MACOLIB_PRINT
                     \ ]
                     \)
            echo "==============================================\n"
            echo "=============HEAP=============================\n"
            call l:obj.prints_and_prompts()
            echo "=============END HEAP=====-====================\n"
            echo "===============================================\n"
            let i += 1
         endwhile
      catch /.*/
         echo "Error "..v:exception
         echo "Read stack values: " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
         let l:elem = l:obj.removeStackStringColor()
         echo "#######>Element removed from stack: "..string(l:elem).."\n"
         echo "Read stack values: " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
         call l:obj.clearStringColor()
         echo "Read stack values: " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
      endtry

      echo "*===============================================================*\n"
      echo "* TESTS REGARDING HEAPS ARE OVER                                *\n"
      echo "* NOW PROCEDURE FOR TESTING STACKS ARE BACK AGAIN               *\n"
      echo "*===============================================================*\n"
      try
         let i = 0
         while i < 40
            call l:obj.addStackStringColor(
                     \ [
                     \ 		i .. ". We enter new string when STACK tested\n",
                     \ 		':hi MyColor  term=italic ctermfg=DarkGrey guifg=#80a0ff gui=italic',
                     \ 		g:func_print_col.MACOLIB_PRINT
                     \ ]
                     \)
            echo "==============================================\n"
            echo "=============STACK============================\n"
            call l:obj.prints_and_prompts()
            echo "=============END STACK===-====================\n"
            echo "==============================================\n"
            let i += 1
         endwhile
      catch /.*/
         echo "Error "..v:exception
         echo "Read heap values: " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
         let l:elem = l:obj.removeHeapStringColor()
         echo "#######>Element removed from heap: "..string(l:elem).."\n"
         echo "Read heap values: " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
         call l:obj.clearStringColor()
         echo "Read heap values: " .. string(l:obj.checks_prints_and_prompts()) .. "\n"
      endtry

   catch /MaCoLib:.*/
      echo "Error catch from catch MyNewVimPlugin: "..v:exception
   catch /MaCoLib1:.*/
      throw "We are the champion"
   endtry
endfunction

"try
"   " We call function TryColors() when BufNewFile.
"   autocmd BufNewFile *.{c,c++,txt} execute ":call TryColors()"
"
"   " We call function TryColors() when BufReadFile.
"   " Interruption managed here (first test see call Stop() bellow)
"   autocmd BufRead *.{c,c++,txt} execute "
"            \:try
"            \|    call TryColors()
"            \|catch /.*/
"            \|    echo \"Stopping due to \" .. v:exception .. \"\n\"
"            \|    call Stop() 
"            \|endtry"
"catch /.*/
"   echo "errrrrrr"
"endtry
