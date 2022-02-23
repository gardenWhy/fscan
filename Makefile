# Output File Location
DIR=temp
$(shell mkdir -p ${DIR})

# Go build flags
LDFLAGS=-ldflags="-s -w " -trimpath

default:
	go build ${LDFLAGS} -o ${DIR} main.gp

# Compile Server - Windows x64
windows:
	export GOOS=windows;export GOARCH=amd64;go build ${LDFLAGS} -o ${DIR}/fscan-Windows-x64.exe main.go

# Compile Server - Linux x64
linux:
	export GOOS=linux;export GOARCH=amd64;go build ${LDFLAGS} -o ${DIR}/fscan-Linux-x64 main.go

# Compile Server - Darwin x64
darwin:
	export GOOS=darwin;export GOARCH=amd64;go build ${LDFLAGS} -o ${DIR}/fscan-Darwin-x64 main.go

clean:
	rm -rf ${DIR}*