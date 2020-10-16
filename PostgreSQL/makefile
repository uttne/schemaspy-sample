.PHONY: build clean

export SERVER_HOST=schemaspy-postgres
export SERVER_DB=SampleDb
export SERVER_USER=postgres
export SERVER_PASS=Password@12345

PGPASS = .pgpass

build : ${PGPASS}
	docker-compose up -d --build db

	docker-compose run --rm wait_db
	docker-compose run --rm create_table
	docker-compose run --rm schemaspy

	docker-compose down

clean : 
	docker-compose down
	bash -c "if [ -d ./output ]; then rm -rf ./output; fi"

${PGPASS} : 
	echo "${SERVER_HOST}:5432:${SERVER_DB}:${SERVER_USER}:${SERVER_PASS}" > ${PGPASS}