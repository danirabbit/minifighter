/*
* Copyright (c) 2016 Daniel Foré (https://github.com/danrabbit/minifighter)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 59 Temple Place - Suite 330,
* Boston, MA 02111-1307, USA.
*
*/

public class MiniFighter : Gtk.Application {

    private string APPNAME = _("Mini Fighter");

    public MiniFighter () {
        Object (application_id: "mini-fighter",
        flags: ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        Gtk.Settings.get_default ().set ("gtk-application-prefer-dark-theme", true);

        weak Gtk.IconTheme default_theme = Gtk.IconTheme.get_default ();
        default_theme.add_resource_path ("/org/danrabbit/minifighter");

        var header = new Gtk.HeaderBar ();
        header.get_style_context ().add_class ("compact");
        header.show_close_button = true;
        header.title = APPNAME;

        var window = new Gtk.ApplicationWindow (this);
        window.title = APPNAME;
        window.set_titlebar (header);
        window.set_default_size (1024, 768);

        var sprite = new Sprite ();

        window.add (sprite);
        window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MiniFighter ();
        return app.run (args);
    }
}
