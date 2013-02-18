mdb+(){
	nohup mongod run --config /usr/local/etc/mongod.conf &
}

mdb-(){
	killall mongod
}
