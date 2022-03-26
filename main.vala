using Gtk;

class Mainwig: Gtk.Window{
  private Gtk.Label location;
  public Mainwig(){
    this.title ="Identity Changer";
    this.destroy.connect (Gtk.main_quit);
    this.window_position = WindowPosition.CENTER;
    this.set_default_size(500,500);
   
    Gtk.Box box = new Gtk.Box(Gtk.Orientation.VERTICAL,0);

    Gtk.Button check = new Gtk.Button.with_label("get the location");
    Gtk.Button start = new Gtk.Button.with_label("start");
    Gtk.Button stop  = new Gtk.Button.with_label("stop");
    //  box.pack_start( new Gtk.Button.with_label("start"),false,false,0 );
    //  box.pack_start( new Gtk.Button.with_label("stop"),false,false,100 );

    check.clicked.connect(oncheck);
    start.clicked.connect(onstart);
    stop.clicked.connect(onstop);

    location = new Gtk.Label("Please Click to get the location");


    box.pack_start(location,false,false,0);
    box.pack_start(check,false,true,0);
    box.pack_start(start,true,true,0);
    box.pack_end(stop,true,true,0);


    box.set_homogeneous(true);
    this.add(box);
    this.show_all();
  }

  public void oncheck( Gtk.Button btn ){
    string test_stdout;
    string test_stderr;
    int test_status;
    try {

        Process.spawn_command_line_sync("python3 /usr/lib/test_anon.py",out test_stdout,out test_stderr,out test_status);
        location.label =test_stdout;

    } catch (SpawnError e) {
        print ("Error: %s\n", e.message);
    }
  }


  public void onstart( Gtk.Button btn ){
    string test_stdout;
    string test_stderr;
    int test_status;
    try {

        Process.spawn_command_line_sync("python3 /usr/lib/run_anon.py",out test_stdout,out test_stderr,out test_status);
        location.label =test_stdout;

    } catch (SpawnError e) {
        print ("Error: %s\n", e.message);
    }
  }

  public void onstop( Gtk.Button btn ){
    string test_stdout;
    string test_stderr;
    int test_status;
    try {

        Process.spawn_command_line_sync("python3 /usr/lib/stop_anon.py",out test_stdout,out test_stderr,out test_status);
        location.label =test_stdout;

    } catch (SpawnError e) {
        print ("Error: %s\n", e.message);
    }
  }
}



int main (string[] args) {

  Gtk.init(ref args);

  Mainwig win = new Mainwig();

  Gtk.main();

  return 0;
}
