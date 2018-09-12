FROM microsoft/mssql-server-linux

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=p@ssw0rd

COPY ./mssql/restore.sh /usr/local/bin/restore
RUN chmod +x /usr/local/bin/restore

# INSTALL EDITORS
RUN apt-get update && apt-get install nano vim -y