start
    = macro

macro
    = @(@command "\n"?)+ ";"?

command
    = cmd:commandVerb conditions:condition? args:(_ @word)+ { return { cmd, conditions, args } }
    / commandVerb

condition
    = _ "[" @word+ "]"

commandVerb
    = "/" @word

word
    = cmd:[\@A-Za-z0-9\?]+ { return cmd.join(''); }

_ = " "