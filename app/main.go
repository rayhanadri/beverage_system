package main

import (
	"beverage_system/cli"
	"beverage_system/config"
)

func main() {
	config.InitDB()
	cli.Run()
}
