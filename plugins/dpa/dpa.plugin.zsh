dpa+() {
	export http_proxy=http://proxy.dpa.de:8080
	export https_proxy=http://proxy.dpa.de:8080
	echo "on"
}

dpa-() {
	unset http_proxy
	unset https_proxy
	echo "off"
}