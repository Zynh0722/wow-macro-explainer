start
    = macro

macro
    = @(@cmdwithargs "\n"?)+

cmdwithargs
    = cmd:command args:(" " @word)+ { return [ cmd, ...args ] }
    / command

command
    = "/" @word

word
    = cmd:[A-Za-z0-9\?]+ { return cmd.join(''); }