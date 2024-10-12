# Makefile for RabbitMQ Point-to-Point Messaging Example

# Variables
DOCKER_RABBITMQ_CONTAINER_NAME=rabbitmq
DOCKER_RABBITMQ_IMAGE=rabbitmq:3-management
GO_CMD=go

# Target to run the RabbitMQ Docker container
.PHONY: run-rabbitmq
run-rabbitmq:
	@echo "Running RabbitMQ in Docker..."
	docker run -d --name $(DOCKER_RABBITMQ_CONTAINER_NAME) -p 5672:5672 -p 15672:15672 $(DOCKER_RABBITMQ_IMAGE)

# Target to stop and remove RabbitMQ Docker container
.PHONY: stop-rabbitmq
stop-rabbitmq:
	@echo "Stopping and removing RabbitMQ container..."
	docker stop $(DOCKER_RABBITMQ_CONTAINER_NAME)
	docker rm $(DOCKER_RABBITMQ_CONTAINER_NAME)

# Target to run the publisher
.PHONY: run-publisher
run-publisher:
	@echo "Running publisher..."
	cd publisher && $(GO_CMD) run publisher.go

# Target to run the consumer
.PHONY: run-consumer
run-consumer:
	@echo "Running consumer..."
	cd consumer && $(GO_CMD) run consumer.go

# Target to clean up the project (optional, if you have any build artifacts)
.PHONY: clean
clean:
	@echo "Cleaning up..."
