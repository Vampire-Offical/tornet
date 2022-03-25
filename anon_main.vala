public static int main (string[] args) {
    string ls_stdout;
    string ls_stderr;
    int ls_status;
    try {
        Process.spawn_command_line_sync ("gksudo -S 'torctl restart'  -m 'please enter your password to activate tor network'",
                                    out ls_stdout,
                                    out ls_stderr,
                                    out ls_status);

        // Output: <File list>
        //  print ("stdout:\n");
        // Output: ````
        print (ls_stdout);
        //  print ("stderr:\n");
        print (ls_stderr);
        // Output: ``0``
        if(ls_status == 256){
            Process.spawn_command_line_sync("notify-send 'your password is wrong \n please try again'");
            
        }
    } catch (SpawnError e) {
        print ("Error: %s\n", e.message);
    }

    return 0;
}