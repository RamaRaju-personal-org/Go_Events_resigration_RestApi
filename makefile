# Makefile for Event Booking REST API

# Variables
PROJECT_NAME=event-booking-api
GOPATH=$(shell go env GOPATH)
SRC_DIR=$(GOPATH)/src
BIN_DIR=$(GOPATH)/bin

# Commands
GIT_CLONE=git clone https://github.com/your-username/$(PROJECT_NAME).git
GO_GET=go get -u
GO_RUN=go run main.go

# Packages
GIN_PKG=github.com/gin-gonic/gin
SQLITE_PKG=github.com/mattn/go-sqlite3
CRYPTO_PKG=golang.org/x/crypto
JWT_PKG=github.com/golang-jwt/jwt/v5

# Phony targets
.PHONY: all install-gin install-sqlite install-crypto install-jwt clone-repo setup run clean

# Default target
all: clone-repo setup run

# Clone repository
clone-repo:
	$(GIT_CLONE) $(SRC_DIR)/$(PROJECT_NAME)
	cd $(SRC_DIR)/$(PROJECT_NAME)

# Install Gin
install-gin:
	$(GO_GET) $(GIN_PKG)

# Install SQLite3 driver for Go
install-sqlite:
	$(GO_GET) $(SQLITE_PKG)

# Install bcrypt for password hashing
install-crypto:
	$(GO_GET) $(CRYPTO_PKG)

# Install JSON Web Tokens for Go
install-jwt:
	$(GO_GET) $(JWT_PKG)

# Setup environment
setup: install-gin install-sqlite install-crypto install-jwt
	@echo "Setting up environment variables..."
	# Add commands to set up environment variables if any

# Run the application
run:
	$(GO_RUN)

# Clean up
clean:
	@echo "Cleaning up..."
	rm -rf $(SRC_DIR)/$(PROJECT_NAME)
	rm -rf $(BIN_DIR)/$(PROJECT_NAME)

# Print help
help:
	@echo "Makefile for Event Booking REST API"
	@echo "Usage:"
	@echo "  make clone-repo     Clone the repository"
	@echo "  make install-gin    Install Gin framework"
	@echo "  make install-sqlite Install SQLite3 driver"
	@echo "  make install-crypto Install bcrypt package"
	@echo "  make install-jwt    Install JWT package"
	@echo "  make setup          Setup environment"
	@echo "  make run            Run the application"
	@echo "  make clean          Clean up"
	@echo "  make help           Print this help message"
