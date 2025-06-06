package funkin.substates;

#if SCRIPTING_ALLOWED
class ScriptedUISubState extends UISubState {
    public static var lastName:String = null;

    public function new(scriptName:String) {
        super();
        if(scriptName == null)
            scriptName = lastName;

        this.scriptName = scriptName;
        lastName = scriptName;
    }
}
#end