ec2-rw() {
	export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
	export EC2_PRIVATE_KEY=~/.ec2/pk-rw.pem
	export EC2_CERT=~/.ec2/cert-rw.pem
	export EC2_ACCESS_KEY="AKIAJPOEFDWUMMT3AMRQ"
	export EC2_REGION=us-east-1
	export EC2_URL=https://ec2.$EC2_REGION.amazonaws.com
	export EC2_SECRET_KEY="export this in .localrc"
}


# alias run_instance="ec2-run-instances ami-9a873ff3 --availability-zone us-east-1a -t m1.small -k rw"
alias run_instance="ec2-run-instances ami-9a873ff3 --availability-zone us-east-1a -t m1.small -k rw"

ec2-name-instance() {
	echo ec2-create-tags -tag Name=$2 $1 
}

ec2-rw
