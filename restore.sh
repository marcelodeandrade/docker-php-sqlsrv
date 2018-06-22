# !/bin/bash
for bak in backup/*.bak; do
    echo "###########################################"
    echo "RESTORING $bak"
    echo "###########################################"

    file=`basename "${bak%.*}"`

    docker exec -it database /opt/mssql-tools/bin/sqlcmd \
    -S localhost -U SA -P 'p@ssw0rd' \
    -Q ' RESTORE DATABASE '$file'
    FROM DISK="/var/opt/mssql/backup/'$file'.bak" WITH
    MOVE "'$file'" TO "/var/opt/mssql/data/'$file'.MDF",
    MOVE "'$file'_log" TO "/var/opt/mssql/data/'$file'_log.ldf"'
done

docker exec -it database /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P 'p@ssw0rd' \
   -Q 'SELECT Name FROM sys.Databases'


  

