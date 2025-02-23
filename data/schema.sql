-- Table: MotionPicture
CREATE TABLE MotionPicture (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    rating FLOAT,
    production VARCHAR(255),
    budget INT,
    CHECK (rating BETWEEN 0 AND 10),
    CHECK (budget > 0)
);

-- Table: User
CREATE TABLE User (
    email VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

-- Table: Likes
CREATE TABLE Likes (
    uemail VARCHAR(255),
    mpid INT,
    PRIMARY KEY (uemail, mpid),
    FOREIGN KEY (uemail) REFERENCES User(email) ON DELETE CASCADE,
    FOREIGN KEY (mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);

-- Table: Movie
CREATE TABLE Movie (
    mpid INT PRIMARY KEY,
    boxoffice_collection FLOAT,
    CHECK (boxoffice_collection >= 0),
    FOREIGN KEY (mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);

-- Table: Series
CREATE TABLE Series (
    mpid INT PRIMARY KEY,
    season_count INT,
    CHECK (season_count >= 1),
    FOREIGN KEY (mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);

-- Table: People
CREATE TABLE People (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nationality VARCHAR(255),
    dob DATE,
    gender ENUM('M', 'F')
);

-- Table: Role
CREATE TABLE Role (
    mpid INT,
    pid INT,
    role_name VARCHAR(255),
    PRIMARY KEY (mpid, pid, role_name),
    FOREIGN KEY (mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE,
    FOREIGN KEY (pid) REFERENCES People(id) ON DELETE CASCADE
);

-- Table: Award
CREATE TABLE Award (
    mpid INT,
    pid INT,
    award_name VARCHAR(255),
    award_year INT,
    PRIMARY KEY (mpid, pid, award_name, award_year),
    FOREIGN KEY (mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE,
    FOREIGN KEY (pid) REFERENCES People(id) ON DELETE CASCADE
);

-- Table: Genre
CREATE TABLE Genre (
    mpid INT,
    genre_name VARCHAR(255),
    PRIMARY KEY (mpid, genre_name),
    FOREIGN KEY (mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);

-- Table: Location
CREATE TABLE Location (
    mpid INT,
    zip VARCHAR(10),
    city VARCHAR(255),
    country VARCHAR(255),
    PRIMARY KEY (mpid, zip),
    FOREIGN KEY (mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);
