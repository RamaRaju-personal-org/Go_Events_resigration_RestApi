# Go_Events_resigration_RestApi
This repo contains Golang RestApi code for Events registration, user creation, events deletion and updation


# Event Booking REST API

A Go-powered "Event Booking" REST API that allows users to browse, create, update, and delete events, as well as manage user registrations and authentication.

## API Endpoints

### Event Management

- **GET /events**
  - Retrieve a list of available events.
  - Authentication: Not required.

- **GET /events/{id}**
  - Retrieve details of a specific event by its ID.
  - Authentication: Not required.

- **POST /events**
  - Create a new bookable event.
  - Authentication: Required.

- **PUT /events/{id}**
  - Update an existing event.
  - Authentication: Required (only by the event creator).

- **DELETE /events/{id}**
  - Delete an existing event.
  - Authentication: Required (only by the event creator).

### User Management

- **POST /signup**
  - Register a new user.
  - Authentication: Not required.

- **POST /login**
  - Authenticate a user and obtain an authentication token (JWT).
  - Authentication: Not required.

### Event Registration

- **POST /events/{id}/register**
  - Register a user for an event.
  - Authentication: Required.

- **DELETE /events/{id}/register**
  - Cancel a user's registration for an event.
  - Authentication: Required.

## Authentication

The API uses JSON Web Tokens (JWT) for authentication. Users must include the token in the Authorization header of requests to protected endpoints.

Example:
```sh
Authorization: Bearer <your-token>
```

## 🚀 Setup and Installation

### :arrow_heading_down: Install Dependencies

#### Clone the repository:
   
   ```sh
   git clone https://github.com/your-username/event-booking-api.git
   cd event-booking-api
  ```

#### Install required packages:

  - **Gin (HTTP web framework written in Go)**
     ```sh
     go get -u github.com/gin-gonic/gin
     ```

   - **SQLite3 driver for Go**
    ```sh
     go get github.com/mattn/go-sqlite3
     ```

   - **bcrypt for password hashing**
     ```sh
     go get -u golang.org/x/crypto
     ```

   - **JSON Web Tokens for Go**
     ```sh
     go get -u github.com/golang-jwt/jwt/v5
     ```

Set up environment variables (e.g., database configuration, JWT secret).

#### Run the application:
   ```sh
   go run main.go
   ```

### 📖 Additional Resources

- [HTTP Status Codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)
- [Go Database SQL](https://pkg.go.dev/database/sql)
- [Go SQLite3](https://github.com/mattn/go-sqlite3)
- [Go JWT](https://github.com/golang-jwt/jwt)

## Usage

Once the API is running, you can interact with it using tools like curl, Postman, or any HTTP client.

### Example Requests

- **Create an Event:**
  ```sh
  curl -X POST -H "Authorization: Bearer <your-token>" -d '{"name": "Event Name", "date": "2024-01-01", "location": "Event Location"}' http://localhost:8080/events
  ```

- **Register for an Event:**
 ```sh
  curl -X POST -H "Authorization: Bearer <your-token>" http://localhost:8080/events/{id}/register
  ```
