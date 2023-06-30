CREATE TABLE IF NOT EXISTS properties (
    id integer PRIMARY KEY AUTO_INCREMENT,
    location_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    cover_image VARCHAR(255) NOT NULL,
    video VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    amenities TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL NOT NULL,
    status VARCHAR(35) NOT NULL,
    purpose VARCHAR(35) NOT NULL,
    average_rating DECIMAL NOT NULL,
    status_expire_date TIMESTAMP NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY (location_id) REFERENCES locations (id)
);