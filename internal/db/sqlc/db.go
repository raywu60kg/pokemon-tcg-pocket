package database

import (
	"database/sql"
	"log"

	_ "github.com/lib/pq"
)

var DB *sql.DB

func InitDatabase() {
	var err error
	dsn := "host=localhost user=postgres password=yourpassword dbname=pokemon port=5432 sslmode=disable"
	DB, err = sql.Open("postgres", dsn)
	if err != nil {
		log.Fatal("Failed to connect to database", err)
	}

	err = DB.Ping()
	if err != nil {
		log.Fatal("Failed to ping database", err)
	}
}
