module main

import vweb

port := '8080'

struct App {
	vweb.Context
}

fn main() {
	app := App{}
	vweb.run(app, port)
}

['/index']
pub fn (mut app App) index() vweb.Result {
	return app.text('v lang web example 1')
}
