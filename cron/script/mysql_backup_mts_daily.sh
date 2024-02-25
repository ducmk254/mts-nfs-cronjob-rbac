# Backup storage directory
backupfolder=/var/backups
# MySQL user
user=readonly
# MySQL password
password=MutosiRead0nly@123
# Number of days to store the backup
keep_day=7
sqlfile=$backupfolder/bk_mts_prod_daily.sql
zipfile=$backupfolder/bk_mts_prod_daily.zip
# Create a backup
sudo mysqldump -u $user -p$password --databases mutosi_prod_2 > $sqlfile
# Compress backup
zip $zipfile $sqlfile
rm $sqlfile
echo $zipfile
# Delete old backups
find $backupfolder -mtime +$keep_day -delete

