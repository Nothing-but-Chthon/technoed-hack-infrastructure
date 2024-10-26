FROM mongo:latest

COPY ./mongo_data /mongo-seed

COPY init-mongo.sh /docker-entrypoint-initdb.d/init-mongo.sh
RUN chmod +x /docker-entrypoint-initdb.d/init-mongo.sh
