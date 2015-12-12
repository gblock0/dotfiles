docker-ip(){
	boot2docker ip 2> /dev/null
}

set-docker-env-vars(){
	boot2docker shellinit
}

