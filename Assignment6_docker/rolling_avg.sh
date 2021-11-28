#!/bin/sh

echo "checking and loading baseball database"
if ! mysql -h bda696_mariadb -u root -pabc123 -e 'USE baseball'; then

  echo "baseball database does not exists"
  mysql -h bda696_mariadb -u root -pabc123 -e create baseball
  echo "loading database..."
  mysql -u root -pabc123 -h bda696_mariadb --database=baseball < /sql/baseball.sql

  else
    echo "baseball does exists"
  fi

mysql -h bda696_mariadb -u root -pabc123 baseball < /sql/Homework2.sql
mysql -h bda696_mariadb -u root -pabc123 baseball -e '
 SELECT * FROM batter_avg_rolling; '> /app/output/rolling_table.txt
 echo "result data stored in result folder"