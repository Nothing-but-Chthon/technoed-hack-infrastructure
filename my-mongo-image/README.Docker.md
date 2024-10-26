# Run in Docker

1. `docker build -t my-mongo-image .`

2. `docker run -d --name my-mongo-container -p 27017:27017 my-mongo-image`
