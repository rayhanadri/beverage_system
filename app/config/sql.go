package config

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

var DB *sql.DB

func InitDB() {
	var err error
	db, err := sql.Open("mysql", "root:@/RMT9_P1")
	if err != nil {
		fmt.Println(err)
	}

	err = db.Ping()
	if err != nil {
		fmt.Println(err)
	}

	DB = db
}
