FROM microsoft/dotnet:latest
COPY . /app
WORKDIR /app
ENV DB_LOCATION /app/customers.db
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
EXPOSE 5000/tcp
CMD ["dotnet", "run", "--server.urls", "http://*:5000"]
