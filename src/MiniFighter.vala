public class MiniFighter : Gtk.Application {

    public MyApp () {
        Object (application_id: "minifighter",
        flags: ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        var app_window = new Gtk.ApplicationWindow (this);

        app_window.show ();
    }

    public static int main (string[] args) {
        MyApp app = new MyApp ();
        return app.run (args);
    }
}
