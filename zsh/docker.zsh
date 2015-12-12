docker-ip(){
	boot2docker ip 2> /dev/null
}

set-docker-env-vars(){
	boot2docker shellinit
}

export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/gregoryblock/.boot2docker/certs/boot2docker-vm
