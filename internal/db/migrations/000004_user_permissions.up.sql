CREATE TABLE user_permissions (
    id CHAR(26) PRIMARY KEY DEFAULT ulid_generate(),
    subject_user_id CHAR(26) NOT NULL,
    object_user_id CHAR(26) NOT NULL,
    permission ENUM('view', 'edit') NOT NULL,
    FOREIGN KEY (subject_user_id) REFERENCES users(id),
    FOREIGN KEY (object_user_id) REFERENCES users(id)
);