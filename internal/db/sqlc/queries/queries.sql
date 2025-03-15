-- name: GetCard :one
SELECT * FROM cards
WHERE id = $1;

-- name: ListCards :many
SELECT * FROM cards
ORDER BY name
LIMIT $1 OFFSET $2;

-- name: ListCardsBySet :many
SELECT * FROM cards
WHERE set_id = $1
ORDER BY card_number
LIMIT $2 OFFSET $3;

-- name: CreateCard :one
INSERT INTO cards (
    name, set_id, card_number, rarity, 
    image_url, pokemon_type, hp
) VALUES (
    $1, $2, $3, $4, $5, $6, $7
) RETURNING *;

-- name: UpdateCard :one
UPDATE cards SET 
    name = $2,
    set_id = $3,
    card_number = $4,
    rarity = $5,
    image_url = $6,
    pokemon_type = $7,
    hp = $8,
    updated_at = NOW()
WHERE id = $1
RETURNING *;

-- name: DeleteCard :exec
DELETE FROM cards WHERE id = $1;

-- name: GetSet :one
SELECT * FROM sets
WHERE id = $1;

-- name: ListSets :many
SELECT * FROM sets
ORDER BY release_date DESC
LIMIT $1 OFFSET $2;

-- name: CreateSet :one
INSERT INTO sets (
    name, code, release_date, symbol_url
) VALUES (
    $1, $2, $3, $4
) RETURNING *;

-- name: GetUser :one
SELECT * FROM users
WHERE id = $1;

-- name: CreateUser :one
INSERT INTO users (
    username, email, password_hash
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: GetUserCollection :many
SELECT c.*, cards.* 
FROM collections c
JOIN cards ON c.card_id = cards.id
WHERE c.user_id = $1
ORDER BY cards.name
LIMIT $2 OFFSET $3;

-- name: AddCardToCollection :one
INSERT INTO collections (
    user_id, card_id, quantity
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: UpdateCardQuantity :one
UPDATE collections
SET quantity = $3, updated_at = NOW()
WHERE user_id = $1 AND card_id = $2
RETURNING *;
