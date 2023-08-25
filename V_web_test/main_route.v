module main

import vweb

struct App {
	vweb.Context
}

fn main() {
	app := App{}
	port := 8080
	vweb.run(app, port)
}

['/index']
pub fn (mut app App) index() vweb.Result {
	html_message := "This is string"
	return $vweb.html()
}
