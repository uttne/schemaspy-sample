.PHONY: build


TAR = sqljdbc_8.4.1.0_jpn.tar.gz
JAR = mssql-jdbc-8.4.1.jre8.jar

build : ${JAR}
	docker-compose up -d --build db
	sleep 15

	docker-compose run create_db
	docker-compose run create_table
	docker-compose run add_comment
	docker-compose run schemaspy

	docker-compose down

${JAR} : ${TAR}
	tar zxvf ${TAR}
	cp ./sqljdbc_8.4/jpn/${JAR} ${JAR}
	rm -r ./sqljdbc_8.4

${TAR} :
	wget https://download.microsoft.com/download/f/c/d/fcd3f599-2d60-46c1-8628-45c2eff1b207/sqljdbc_8.4.1.0_jpn.tar.gz