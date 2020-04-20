aws-sync:
	aws s3 --profile $AWS_PROFILE sync ./tiles $AWS_BUCKET_ADDRESS --quiet --delete

deb:
	./create-deb.sh
