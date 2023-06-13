aws-sync:
	aws-vault exec ${AWS_PROFILE} -- aws s3 sync ./tiles ${AWS_BUCKET_ADDRESS} --delete

deb:
	./create-deb.sh
