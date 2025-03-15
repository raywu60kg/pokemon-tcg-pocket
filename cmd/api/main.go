package main

import (
	"log"
	"pokemon-tcg-pocket/database"
	"pokemon-tcg-pocket/routes"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	database.InitDatabase()

	routes.SetupRoutes(r)

	log.Fatal(r.Run(":3000"))
}
