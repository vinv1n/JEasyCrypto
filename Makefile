all: lib client server

# Builds the EasyCrypto libary
lib:
	mkdir -p JEasyCrypto/bin
	javac JEasyCrypto/src/easycrypto/*.java -d JEasyCrypto/bin
	cd JEasyCrypto/bin/ && jar cvf ../../EasyCryptoLib.jar easycrypto/*.class

# Builds the JEasyCryptoServer
client:
	mkdir -p JEasyCryptoClient/bin
	javac JEasyCryptoClient/src/*.java -classpath "json-20190722.jar:." -d JEasyCryptoClient/bin

# Builds the JEasyCryptoServer
server:
	mkdir -p JEasyCryptoServer/bin
	javac JEasyCryptoServer/src/*.java -classpath "EasyCryptoLib.jar:json-20190722.jar:." -d JEasyCryptoServer/bin

# Remove built binaries
clean:
	rm -rf JEasyCryptoClient/bin \
			JEasyCrypto/bin \
			JEasyCryptoServer/bin \
			EasyCryptoLib.jar