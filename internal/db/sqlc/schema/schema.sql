-- Pokemon TCG Pocket Database Schema

-- Cards table to store card information
CREATE TABLE IF NOT EXISTS cards (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    set_id INT NOT NULL,
    card_number VARCHAR(50) NOT NULL,
    rarity VARCHAR(50),
    image_url VARCHAR(255),
    pokemon_type VARCHAR(50),
    hp INT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Sets table to store set information
CREATE TABLE IF NOT EXISTS sets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(50) NOT NULL UNIQUE,
    release_date DATE,
    symbol_url VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Users table for user management
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Collections table to track users' card collections
CREATE TABLE IF NOT EXISTS collections (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    card_id INT NOT NULL REFERENCES cards(id),
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    UNIQUE(user_id, card_id)
);

-- Add foreign key constraint to cards table
ALTER TABLE cards ADD CONSTRAINT fk_cards_sets FOREIGN KEY (set_id) REFERENCES sets(id);
