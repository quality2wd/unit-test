# Whatsdoc Test Integration Kit

## Description

This is a test integration kit built with [cucumber/godog](https://github.com/cucumber/godog).

It comes pre-configured with :

1. Cucumber Godog (<https://github.com/cucumber/godog>
2. Godog HTTP API (<https://github.com/pawelWritesCode/godog-http-api>)

Shout out to [pawelWritesCode](https://github.com/pawelWritesCode) for the awesome work on godog-http-api!



## How to Use
install go in your local
Ubuntu
```sh
Ubuntu
sudo apt update; sudo apt install golang-go
export PATH=$PATH:/usr/local/go/bin
source $HOME/.profile.

```
For other OS you can follow this link
```sh
https://go.dev/doc/install
```
check version :
```sh
go version
```

To use this kit, you need to have [godog](https://github.com/cucumber/godog) installed on your machine.
For godog, use this command to install it:
go to your project path and copy paste this command into your terminal
```sh
$ go install github.com/cucumber/godog/cmd/godog@latest
```

If you can type `godog` and not show errors YEEAAYYY congratulation!!! you can run the test.

## How to Run
```sh
godog run features/patient.feature  #for specific file
godog run #run all test
```

## how to Develop

ignore all the folders in there, you only focus on the folder named features. There you can start developing the code for the test.

default DEBUG mode is false, you can activate it by changing the code in .env to `GODOG_DEBUG=true`