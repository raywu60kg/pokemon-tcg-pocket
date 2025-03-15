CREATE TABLE user_needed_pokemon (
    id CHAR(26) PRIMARY KEY DEFAULT ulid_generate(),
    user_id CHAR(26) NOT NULL,
    pokemon_id CHAR(26) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemons(id)
);