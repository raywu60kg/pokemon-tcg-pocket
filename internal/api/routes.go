package routes

import (
	"pokemon-tcg-pocket/controllers"

	"github.com/gin-gonic/gin"
)

func SetupRoutes(r *gin.Engine) {
	r.GET("/pokemons", controllers.GetPokemons)
	r.GET("/pokemons/:id", controllers.GetPokemon)
	r.POST("/pokemons", controllers.CreatePokemon)
	r.PUT("/pokemons/:id", controllers.UpdatePokemon)
	r.DELETE("/pokemons/:id", controllers.DeletePokemon)
}
