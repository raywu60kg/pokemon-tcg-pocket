package handlers

import (
	"net/http"
	"pokemon-tcg-pocket/database"
	"pokemon-tcg-pocket/models"

	"github.com/gin-gonic/gin"
)

func GetPokemons(c *gin.Context) {
	var pokemons []models.Pokemon
	database.DB.Find(&pokemons)
	c.JSON(http.StatusOK, pokemons)
}

func GetPokemon(c *gin.Context) {
	id := c.Param("id")
	var pokemon models.Pokemon
	if err := database.DB.First(&pokemon, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Pokemon not found"})
		return
	}
	c.JSON(http.StatusOK, pokemon)
}

func CreatePokemon(c *gin.Context) {
	var pokemon models.Pokemon
	if err := c.ShouldBindJSON(&pokemon); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	database.DB.Create(&pokemon)
	c.JSON(http.StatusOK, pokemon)
}

func UpdatePokemon(c *gin.Context) {
	id := c.Param("id")
	var pokemon models.Pokemon
	if err := database.DB.First(&pokemon, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Pokemon not found"})
		return
	}
	if err := c.ShouldBindJSON(&pokemon); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	database.DB.Save(&pokemon)
	c.JSON(http.StatusOK, pokemon)
}

func DeletePokemon(c *gin.Context) {
	id := c.Param("id")
	var pokemon models.Pokemon
	if err := database.DB.First(&pokemon, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Pokemon not found"})
		return
	}
	database.DB.Delete(&pokemon)
	c.JSON(http.StatusOK, gin.H{"message": "Pokemon successfully deleted"})
}
