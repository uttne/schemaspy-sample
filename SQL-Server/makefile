.PHONY: build clean

export SQLSERVER_HOST=schemaspy-sqlserver
export SQLSERVER_USER=sa
export SQLSERVER_PASS=Password@12345

TAR = sqljdbc_8.4.1.0_jpn.tar.gz
JAR = mssql-jdbc-8.4.1.jre8.jar

build : ${JAR}
	docker-compose up -d --build db

	docker-compose run --rm wait_db
	docker-compose run --rm create_db
	docker-compose run --rm create_table
	docker-compose run --rm schemaspy

	docker-compose down

clean : 
	docker-compose down

${JAR} : ${TAR}
	tar zxvf ${TAR}
	cp ./sqljdbc_8.4/jpn/${JAR} ${JAR}
	rm -r ./sqljdbc_8.4

${TAR} :
	# https://docs.microsoft.com/ja-jp/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver15
	wget https://download.microsoft.com/download/f/c/d/fcd3f599-2d60-46c1-8628-45c2eff1b207/sqljdbc_8.4.1.0_jpn.tar.gz