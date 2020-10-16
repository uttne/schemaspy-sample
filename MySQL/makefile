.PHONY: build clean

export SERVER_HOST=schemaspy-mysql
export SERVER_DB=SampleDb
export SERVER_USER=root
export SERVER_PASS=Password@12345

TAR = mysql-connector-java-8.0.21.tar.gz
JAR = mysql-connector-java-8.0.21.jar

build : ${JAR}
	docker-compose up -d --build db

	docker-compose run --rm wait_db
	docker-compose run --rm create_table
	docker-compose run --rm schemaspy

	docker-compose down

clean : 
	docker-compose down
	bash -c "if [ -d ./output ]; then rm -rf ./output; fi"

${JAR} : ${TAR}
	tar zxvf ${TAR}
	cp ./mysql-connector-java-8.0.21/${JAR} ${JAR}
	rm -r ./mysql-connector-java-8.0.21

${TAR} :
	wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.21.tar.gz