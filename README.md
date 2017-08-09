## Customers microservice
This service provides customers REST API.
This service is one part of a larger micro services example app.

### Run the project locally
```
dotnet restore
dotnet run
```
Then browse: http://localhost:5000/api/Customer

### Building & running the docker image

There is 1 environment variable needed for the app to run:
1. DB_LOCATION - Path to a sqllite db file. Example: /opt/customers.db

This variable has a default value pointing to the included db in the repo,
so incase you just want to play with it, run it without the variable.

To build the image, open a command line in the repo folder and run:
```
docker build . -t <my-private-repo>/customer-service:1.0.0
```

Then run the image using:
```
docker run --name customer-service -e DB_LOCATION='<path-to-db-file>' -p 5000:5000 <my-private-repo>/customer-service:1.0.0
```

### Creating the db
```
sqlite3 customers.db
CREATE TABLE Customers(
 Id integer,
 FirstName text NOT NULL,
 LastName text NOT NULL,
 Age Integer NOT NULL,
 PRIMARY KEY (Id)
);
insert into customers values(1,'Popo','Man',12);
.exit
```
