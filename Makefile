IMAGE := saikatharryc/api-base

build-image:
	docker build -t $(IMAGE) .

push-image:
	docker push $(IMAGE)