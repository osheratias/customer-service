FROM microsoft/dotnet:latest
RUN adduser --disabled-password --gid 0 --gecos "Runner user" runneruser
COPY . /home/runneruser/customer-service
RUN chown -R runneruser:root /home/runneruser && chmod -R 0775 /home/runneruser
USER runneruser
ENV HOME /home/runneruser
WORKDIR /home/runneruser/customer-service
ENV DB_LOCATION /home/runneruser/customer-service/customers.db
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
EXPOSE 5000/tcp
CMD su - runneruser -c "dotnet run --server.urls http://*:5000"
