FROM microsoft/dotnet:latest

COPY . /app

WORKDIR /app

RUN yum -y install sqlite &&\ 
sqlite3 customers.db &&\ 
CREATE TABLE Customers(\ 
 Id integer,\ 
 FirstName text NOT NULL,\ 
 LastName text NOT NULL,\ 
 Age Integer NOT NULL,\ 
 PRIMARY KEY (Id)\ 
); &&\ 
insert into customers values(1,'Popo','Man',12);&&\ 
.exit 

ENV DB_LOCATION /app/customers.db

RUN ["dotnet", "restore"]

RUN ["dotnet", "build"]

EXPOSE 5000/tcp

CMD ["dotnet", "run", "--server.urls", "http://*:5000"]
