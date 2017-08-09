FROM microsoft/dotnet:latest
RUN adduser --disabled-password --gid 0 --gecos "My user" myuser
COPY . /home/myuser/customer-service
RUN chown -R myuser:root /home/myuser && chmod -R 0775 /home/myuser
USER myuser
ENV HOME /home/myuser
RUN ls -al
WORKDIR /home/myuser/customer-service
ENV DB_LOCATION /home/myuser/customer-service/customers.db
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
EXPOSE 5000/tcp
CMD ["dotnet", "run", "--server.urls", "http://*:5000"]
