"map ,d oimport sys;import inspect;print>>sys.stderr,"Bo ("+str(__file__)+"): "+str(inspect.currentframe().f_lineno)<ESC>kJ
map ,d ofrom botools import bo_debug; bo_debug(str(__file__), 'Bo');<ESC>h
map ,e :w<CR>:!/usr/bin/env python %<CR>
map ,l :w<CR>:!python -c "import py_compile,sys; sys.stderr=sys.stdout; py_compile.compile(r'%')"<CR>
