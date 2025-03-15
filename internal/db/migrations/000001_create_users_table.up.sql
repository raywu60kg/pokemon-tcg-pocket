CREATE TABLE users (
    id CHAR(26) PRIMARY KEY DEFAULT ulid_generate(),
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);
