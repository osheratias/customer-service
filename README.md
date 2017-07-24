## Customers microservice
This service provides coustomers REST API.
This service is one part of a larger micro services example app.

### How to run

There is 1 environment variable needed for the app to run:
1. DB_LOCATION - Path to a sqllite db file. Example: /opt/customers.db

##### Creating the db
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

##### Building the image
```
dotnet restore
dotnet run
```
Test locally: http://localhost:5000/api/Customer

Then build the image with:
```
```

##### Run after the image is built:
```
docker run -e DB_LOCATION='<path-to-db-file>' -p 5000:5000 <my-private-repo>/customer-service:1.0.0
```