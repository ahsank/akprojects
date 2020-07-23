## Emacs
Keyword: ~emacs

### Keys

* C-w Kill the region (kill-region).
* M-w Copy the region into the kill ring (kill-ring-save).
* M-d Kill the next word (kill-word). See Words.
* M-<DEL> Kill one word backwards (backward-kill-word).
* C-x <DEL> Kill back to beginning of sentence (backward-kill-sentence). See Sentences.
* M-k Kill to the end of the sentence (kill-sentence).
* C-M-k Kill the following balanced expression (kill-sexp). See Expressions.
* M-z char Kill through the next occurrence of char (zap-to-char).
* Prefix argument C-u M-x google3-test asks for prefix where -c dbg can be passed.

Version control:

* C-x v v     vc-next-action -- perform the next logical control operation on file
* C-x v i     vc-register -- add a new file to version control

Autogen:

* `autogen`, `genc`, `gencunit`, `genjunit`, `genpy`, `genpyunit`
* 

### Emacs server

    M-x server-start
	M-x set-variable <RET> server-name <RET> foo <RET>
	emacsclient [-s server_name]
	emacsclient -nw
	emacs --daemon

    When done with emacsclient kill frame by C-x 5 0

    ;; Color schemes
	color-scheme-select
	Vim Colors
	Feng Shui
	Rotor
	Wheat
	Greiner
	XP
	Charcoal Black
Csearch: f6

    -n -local -f '.*ggive.*\.py$' is_valid.
	

### Cscope
Build the database

    ~/bin/buildcsope kawa ~/packages/android/kawa

a. Put `xcscope.el` in Emacs load path (typically `"~/.emacs.d"`).
b. Modify your `.emacs`.

    (require 'xcscope)
    ;; Time-consuming on large projects
    ;; (setq cscope-do-not-update-database t)
    ;; Initial directory

    (setq cscope-set-initial-directory "~/scaope/kawa/")

c. In  you can use the following hotkeys to use cscope

    ;;      C-c s s         Find symbol.
    ;;      C-c s d         Find global definition.
    ;;      C-c s g         Find global definition (alternate binding).
    ;;      C-c s G         Find global definition without prompting.
    ;;      C-c s c         Find functions calling a function.
    ;;      C-c s C         Find called functions (list functions called
    ;;                      from a function).
    ;;      C-c s t         Find text string.
    ;;      C-c s e         Find egrep pattern.
    ;;      C-c s f         Find a file.
    ;;      C-c s i         Find files #including a file.
	
	;; Grok C-c , prefix
	d jump to definition
	b pop back
	f go forward
	x cross reference
	

Git
---------------------
Get linked repositories.

     git submodule init
	 git submodule update
	 
# Algorithm

    
GDB commands
============
 
    # gdb <program> [core dump]
	Start GDB (with optional core dump).
	# gdb --args <program> <args…>
	Start GDB and pass arguments
	# gdb --pid <pid>
	Start GDB and attach to process.
	set args <args...>
	Set arguments to pass to program to
	be debugged.
	run
	Run the program to be debugged.
	kill
	Kill the running program

    break <where>
	Set a new breakpoint.
	delete <breakpoint#>
	Remove a breakpoint.
	clear
	Delete all breakpoints.
	enable <breakpoint#>
	Enable a disabled breakpoint.
	disable <breakpoint#>
	Disable a breakpoint

    watch <where>
	Set a new watchpoint.
	delete/enable/disable <watchpoint#>
	Like breakpoints.

    function_name
    Break/watch the named function.
    line_number
    Break/watch the line number in the current
    source file.
    file:line_number
    Break/watch the line number in the
    named source file.

    break/watch <where> if <condition>
	Break/watch at the given location if the
	condition is met.
	Conditions may be almost any C expression
	that evaluate to true or false.
	condition <breakpoint#> <condition>
	Set/change the condition of an existing
	break- or watchpoint.

    backtrace
	where
	Show call stack.
	backtrace full
	where full
	Show call stack, also print the local variables
	in each frame.
	frame <frame#>
	Select the stack frame to operate on.

    step
	Go to next instruction (source line), diving
	into function.
	next
	Go to next instruction (source line) but
	donʻt dive into functions.
	finish
	Continue until the current function returns.
	continue
	Continue normal execution

    print/format <what>
	Print content of variable/memory location/register.
	display/format <what>
	Like „print“, but print the information
	after each stepping instruction.
	undisplay <display#>
	Remove the „display“ with the given
	number.
	enable display <display#>
	disable display <display#>
	En- or disable the „display“ with the given
	number.
	x/nfu <address>
	Print memory.
	n: How many units to print (default 1).
	f: Format character (like „print“).
	u: Unit.
	Unit is one of:
	b: Byte,
	h: Half-word (two bytes)
	w: Word (four bytes)
	g: Giant word (eight bytes)).

    a Pointer.
	c Read as integer, print as character.
	d Integer, signed decimal.
	f Floating point number.
	o Integer, print as octal.
	s Try to treat as C string.
	t Integer, print as binary (t = „two“).
	u Integer, unsigned decimal.
	x Integer, print as hexadecimal.

    expression
	Almost any C expression, including
	function calls (must be prefixed with a
	cast to tell GDB the return value type).
	file_name::variable_name
	Content of the variable defined in the
	named file (static variables).
	function::variable_name
	Content of the variable defined in the
	named function (if on the stack).
	{type}address
	Content at address, interpreted as
	being of the C type type.
	$register
	Content of named register. Interesting
	registers are $esp (stack pointer), $ebp
	(frame pointer) and $eip (instruction
	pointer).

    thread <thread#>
	Chose thread to operate on.

    set var <variable_name>=<value>
	Change the content of a variable to the
	given value.
	return <expression>
	Force the current function to return immediately,
	passing the given value.

    directory <directory>
	Add directory to the list of directories
	that is searched for sources.
	list
	list <filename>:<function>
	list <filename>:<line_number>
	list <first>,<last>
	Shows the current or given source context.
	The filename may be omitted. If
	last is omitted the context starting at
	start is printed instead of centered around
	it.
	set listsize <count>
	Set how many lines to show in „list“.

    handle <signal> <options>
	Set how to handle signles. Options are:
	(no)print: (Donʻt) print a message when
	signals occurs.
	(no)stop: (Donʻt) stop the program
	when signals occurs.
	(no)pass: (

    (no)pass: (Donʻt) pass the signal to the
	program.


    disassemble
	disassemble <where>
	Disassemble the current function or
	given location.
	info args
	Print the arguments to the function of
	the current stack frame.
	info breakpoints
	Print informations about the break- and
	watchpoints.
	info display
	Print informations about the „displays“.
	info locals
	Print the local variables in the currently
	selected stack frame.
	info sharedlibrary
	List loaded shared libraries.
	info signals
	List all signals and how they are currently
	handled.
	info threads
	List all threads.
	show directories
	Print all directories in which GDB searches
	for source files.
	show listsize
	Print how many are shown in the „list“
	command.
	whatis variable_name
	Print type of named variable

    set pagination off
	set logging off
	
End gdb
