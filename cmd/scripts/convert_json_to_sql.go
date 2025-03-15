package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"os"
)

type Pokemon struct {
	ID     string `json:"id"`
	Name   string `json:"name"`
	Rarity string `json:"rarity"`
	Pack   string `json:"pack"`
	Health string `json:"health"`
	Image  string `json:"image"`
}

func main() {
	// Read the JSON file
	file, err := os.Open("cmd/scripts/v3.json")
	if err != nil {
		log.Fatalf("Failed to open file: %s", err)
	}
	defer file.Close()

	byteValue, err := io.ReadAll(file)
	if err != nil {
		log.Fatalf("Failed to read file: %s", err)
	}

	// Parse the JSON data
	var pokemons []Pokemon
	err = json.Unmarshal(byteValue, &pokemons)
	if err != nil {
		log.Fatalf("Failed to parse JSON: %s", err)
	}

	// Generate the SQL script
	sqlScript := ""

	for _, pokemon := range pokemons {
		sqlScript += fmt.Sprintf("INSERT INTO pokemons (id, name, rarity, pack, health, image) VALUES ('%s', '%s', '%s', '%s', '%s');\n",
			pokemon.ID, pokemon.Name, pokemon.Rarity, pokemon.Pack, pokemon.Image)
	}

	// Write the SQL script to a file
	err = os.WriteFile("insert_pokemon.sql", []byte(sqlScript), 0644)
	if err != nil {
		log.Fatalf("Failed to write SQL script: %s", err)
	}

	fmt.Println("SQL script generated successfully: insert_pokemon.sql")
}
