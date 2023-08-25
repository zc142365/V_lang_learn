module main

import vweb
import db.mysql

struct App {
	vweb.Context
}

fn main() {
	app := App{}
	port := 8080
	mut conn := mysql.connect(
		host:'localhost'
		port:3306
		username: 'user1'
		password: 'password1'
		dbname: 'default'
	)

	res := conn.query('show tables')!
	for row in res.rows() {
		println(row.vals.join(', '))
	}
	conn.close()
	
	vweb.run(app, port)
}

['/index']
pub fn (mut app App) index() vweb.Result {
	html_message := "This is string"
	return $vweb.html()
}
