start
    = macro

macro
    = @(@cmdwithargs "\n"?)+ ";"?

cmdwithargs
    = cmd:command conditions:condition? args:(" " @word)+ { return { cmd, conditions, args } }
    / command

condition
    = " [" @word+ "]"

command
    = "/" @word

word
    = cmd:[\@A-Za-z0-9\?]+ { return cmd.join(''); }