gui = require 'nw.gui'
pass1 = require '1pass'

win = gui.Window.get();

# Create a menubar  or window menu
menubar = new gui.Menu(
    type: 'menubar'
)

# Create File menuitem
file_menu = new gui.Menu()
# File -> New...
file_menu_new = new gui.Menu()

file_menu_new.append(new gui.MenuItem(
    label: 'Login Item',
    enabled: false,
))

file_menu_new.append(new gui.MenuItem(
    label: 'Wallet Item',
    checked: true,
    click: () ->
        console.log("Wallet Item")
))

file_menu.append(new gui.MenuItem(
    label: 'New',
    submenu: file_menu_new,
))

menubar.append(new gui.MenuItem(
    label: 'File',
    submenu: file_menu
))

# assign the menubar to window menu
win.menu = menubar

window.onresize = (event) ->
    tbheight = document.getElementById("toolbar").style.height
    document.getElementById("sidebar").style.height = document.body.clientHeight - (tbheight + 35)
    return