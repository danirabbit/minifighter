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

public class Sprite : Gtk.Grid {

    const string SPRITE_STYLE_CSS = """
        @keyframes breathe {
            100% { background-position: -304px 0; }
        }

        @keyframes walk {
            0% { background-position: -304px 0; }
            100% { background-position: -684px 0; }
        }

        .sprite {
            animation: breathe 1s steps(4) infinite;
            background-image: url("resource:///org/danrabbit/minifighter/Sprite.svg");
            background-position: 0 0;
        }

        .sprite.walking {
            animation: walk 1s steps(5) infinite;
        }
    """;

    public Sprite () {
        add_events (Gdk.EventMask.KEY_PRESS_MASK);
        can_focus = true;
        key_press_event.connect (on_key_press_event);
    }

    construct {
        var provider = new Gtk.CssProvider ();
        try {
            provider.load_from_data (SPRITE_STYLE_CSS, SPRITE_STYLE_CSS.length);
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        } catch (Error e) {
            critical (e.message);
        }

        get_style_context ().add_class ("sprite");
        width_request = 76;
        height_request = 80;
        halign = Gtk.Align.START;
        valign = Gtk.Align.START;
    }

    private bool on_key_press_event (Gdk.EventKey event) {
        string key = Gdk.keyval_name (event.keyval);
        message ("Keypress: %s".printf (key));

        switch (key) {
            case "Up":
                if (margin_top > 0) {
                    margin_top += -1;
                    get_style_context ().add_class ("walking");
                }
                break;
            case "Down":
                margin_top += 1;
                get_style_context ().add_class ("walking");
                break;
            case "Left":
                if (margin_start > 0) {
                    margin_start += -1;
                    get_style_context ().add_class ("walking");
                }
                break;
            case "Right":
                margin_start += 1;
                get_style_context ().add_class ("walking");
                break;
            default:
                break;
        }

        return true;
    }
}
