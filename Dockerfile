FROM microsoft/dotnet:latest

RUN adduser --disabled-password --gid 0 --gecos "Runner user" runneruser
ENV HOME /home/runneruser
ENV DB_LOCATION /home/runneruser/customer-service/customers.db

COPY . /home/runneruser/customer-service
WORKDIR /home/runneruser/customer-service
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]

RUN chown -R runneruser:root /home/runneruser && chmod -R 0775 /home/runneruser
USER runneruser

EXPOSE 5000/tcp
CMD ["dotnet", "run", "--server.urls", "http://*:5000"]
