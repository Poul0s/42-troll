rm -rf "$HOME/.local/share/gnome-shell/extensions/ft_fake_lock@tomoron"
mkdir -p "$HOME/.local/share/gnome-shell/extensions/ft_fake_lock@tomoron"
cd "$HOME/.local/share/gnome-shell/extensions/ft_fake_lock@tomoron"
echo "const St = imports.gi.St;
const Gio = imports.gi.Gio;

const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();
const Main = imports.ui.main;
const Mainloop = imports.mainloop;
const PanelMenu = imports.ui.panelMenu;

let debounceTimeout = null;

class Extension {
    constructor() {
        this._indicator = null;
    }
    
    enable() {
        log(\`enabling \${Me.metadata.name}\`);

        let indicatorName = \`\${Me.metadata.name} Indicator\`;
        
        // Create a panel button
        this._indicator = new PanelMenu.Button(0.0, indicatorName, false);
        
        // Add an icon
        let icon = new St.Icon({
            gicon: new Gio.ThemedIcon({name: 'system-lock-screen-symbolic'}),
            style_class: 'system-status-icon'
        });
        this._indicator.add_child(icon);
	this._indicator.connect('button-press-event', _cock);

        // \`Main.panel\` is the actual panel you see at the top of the screen,
        // not a class constructor.
        Main.panel.addToStatusArea(indicatorName, this._indicator);
    }
    
    // REMINDER: It's required for extensions to clean up after themselves when
    // they are disabled. This is required for approval during review!
    disable() {
        log(\`disabling \${Me.metadata.name}\`);

        this._indicator.destroy();
        this._indicator = null;
    }
}

function _cock() {
    if (debounceTimeout === null) {
      debounceTimeout = Mainloop.timeout_add(420, function() {
        debounceTimeout = null;
	let proc = Gio.Subprocess.new(['bash', '-c', 'ft_lock; sleep 10; gnome-session-quit --no-prompt'], 0);
	proc.wait_async(null, null);
        return false;
      });
    }

}

function init() {
    log(\`initializing \${Me.metadata.name}\`);
    
    return new Extension();
}" >> extension.js

echo '{
    "name": "a perfectly real lock button that will not log you out",
    "description": "definitely not",
    "original-author": "sb@42.fr",
    "url": "https://tmoron.fr/rick",
    "uuid": "ft_fake_lock@tomoron",
    "shell-version": [
	"40",
	"41",
	"42"
    ],
    "gettext-domain": "lockscreen",
    "version": 1
}' >> metadata.json
killall -3 gnome-shell
gnome-extensions enable ft_fake_lock@tomoron
gnome-extensions disable cockscreen_by_malik@tomoron
gnome-extensions disable lockscreen@42network.org
