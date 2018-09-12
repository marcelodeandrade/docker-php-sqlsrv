# !/bin/bash
cd /var/opt/mssql/backup/

echo "###########################################"
echo "RESTORING Backups "
echo "###########################################"

for bak in $(find -name *.bak); do
    echo "RESTORING $bak"

    file=`basename "${bak%.*}"`

    /opt/mssql-tools/bin/sqlcmd \
    -S localhost -U SA -P 'p@ssw0rd' \
    -Q ' RESTORE DATABASE '$file'
    FROM DISK="/var/opt/mssql/backup/'$file'.bak" WITH
    MOVE "'$file'" TO "/var/opt/mssql/data/'$file'.MDF",
    MOVE "'$file'_log" TO "/var/opt/mssql/data/'$file'_log.ldf"'
done

/opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P 'p@ssw0rd' \
   -Q 'SELECT Name FROM sys.Databases'


  

