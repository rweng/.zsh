delete-soc(){
	sudo sh -c 'awk "!/soc-daily/" /private/etc/hosts > /tmp/hosts'
	sudo mv -f /tmp/hosts /private/etc/hosts
}

soc-daily(){
	delete-soc
}

soc-local(){
	delete-soc
	sudo sh -c 'echo "127.0.0.1 soc-daily.dyndns.org" >> /private/etc/hosts'
}