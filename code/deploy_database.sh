#! /bin/sh

git pull origin

mkdir /srv/db_sprint_I/

cd database || ! echo "FALHA! Pasta não encontrada"


docker network create puc
docker ps -a | awk '{ print $1,$2 }' | grep flpsantoro/db_sprint_i:1.0 | awk '{print $1 }' | xargs -I {} docker rm -f {}
docker rmi flpsantoro/db_sprint_i:1.0
docker build --tag=flpsantoro/db_sprint_i:1.0 --rm=true .

docker run --name db_sprint_i --hostname=db_sprint_i \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=admin\
  -e POSTGRES_DB=balanca \
  -e ALLOW_IP_RANGE='0.0.0.0/0' \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -v /srv/db_sprint_I:/var/lib/postgresql/data \
  -v /etc/localtime:/etc/localtime:ro \
  -p 33010:5432 \
  --network=puc \
  -d flpsantoro/db_sprint_i:1.0

cp ./*.sql /srv/db_sprint_I/

echo "Aguardando o servidor..."
sleep 5

docker exec db_sprint_i psql "host='db_sprint_i' port='5432' dbname='balanca' user='postgres' password='admin'" -a -f /var/lib/postgresql/data/create.sql
echo "Deploy finalizado"
