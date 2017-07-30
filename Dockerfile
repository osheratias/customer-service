FROM microsoft/dotnet:latest
RUN adduser --disabled-password --gecos "" runneruser
COPY . /app
WORKDIR /app
ENV DB_LOCATION /app/customers.db
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
EXPOSE 5000/tcp
CMD su - runneruser -c "dotnet run --server.urls http://*:5000"
