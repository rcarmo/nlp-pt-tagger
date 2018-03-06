export IMAGE_NAME=rcarmo/pt-tagger-trainer
export VCS_REF=`git rev-parse --short HEAD`
export BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`

setup:
	docker build --build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg VCS_REF=$(VCS_REF) \
		--build-arg VCS_URL=$(VCS_URL) \
		--build-arg BASE=$(BASE) \
		-t $(IMAGE_NAME) trainer
	docker build --build-arg BUILD_DATE=$(BUILD_DATE) \
		--build-arg VCS_REF=$(VCS_REF) \
		--build-arg VCS_URL=$(VCS_URL) \
		--build-arg BASE=$(IMAGE_NAME) \
		-t $(IMAGE_NAME)-test tester

train:
	docker run -v "$$(pwd)":/output -ti $(IMAGE_NAME)

test:
	docker run -v "$$(pwd)":/input -ti $(IMAGE_NAME)-test

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $$(docker images --format '{{.Repository}}:{{.Tag}}' | grep '$(IMAGE_NAME)')