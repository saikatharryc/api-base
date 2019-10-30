IMAGE := saikatharryc/api-base

image:
	docker build -t $(IMAGE) .

push-image:
	docker push $(IMAGE)