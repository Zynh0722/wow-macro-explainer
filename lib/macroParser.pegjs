start
    = macro

macro
    = @(@command "\n"?)+ ";"?

command
    = "/" cmd:word commandObjects:commandObject { return { cmd, ...commandObjects } }

commandObject
	= conditions:conditions? params:(_ @word)* { return { conditions, params } }

conditions
    = _ "[" @(@(option / "@" @target) ("," _)?)+ "]" 

word
    = cmd:[A-Za-z0-9\?]+ { return cmd.join(''); }

option
	= "exists"
    / "help"
    / "harm"
    / "dead"
    / "party"
    / "raid"
    / "unithasvehicleui"
    / "canexitvehicle"
    / "channeling" (":" @word)?
    / "combat"
    / ("equipped" / "worn") (":" @word)?
    / "stance"
    / "flyable"
    / "flying"
    / "form" [0-6]
    / @"group" ":" @("party" / "raid")?
    / "indoors"
    / "outdoors"
    / "mounted"
    / @"pet" ":" @word
    / "petbattle"
    / "pvpcombat"
    / "resting"
    / "spec" (":" @("/"? @[0-5])*)
    / "stealth"
    / "swimming"
    / "talent" (":" row:[1-3] "/" col:[1-7] {return {row, col}})
    / @("actionbar" / "bar") ":" @("/"? @[1-9])+
    / "bonusbar" (":" @[1-9])?
    / @"button" ":" @[1-9]
    / "cursor"
    / "extrabar"
    / ("modifer" / "mod") (":" @word)?
	/ "overridebar"
    / "possessbar"
    / "shapeshift"
    / "vehicleui"

target
	= "arena" [1-5]
    / "boss" [1-8]
    / "focus"
    / "mouseover"
    / "none"
    / "party" [1-4]
    / "partypet" [1-4]
    / "pet"
    / "player"
    / "raid" num1to40
    / "raidpet" num1to40
    / "target"
    / "vehicle"
    
num1to40
	= ((a:[1-3] b:[1-9] { return a + b }) / "40" / [1-9])

_ "whitespace"
	= " "