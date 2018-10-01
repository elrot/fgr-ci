BUILDER_IMAGE=elrot/mister-builder

builder:
	docker build -t $(BUILDER_IMAGE) .
	docker push $(BUILDER_IMAGE)