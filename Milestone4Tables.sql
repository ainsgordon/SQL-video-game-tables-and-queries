ALTER TABLE Game_Genre DROP FOREIGN KEY FK_GameID;
ALTER TABLE Game_Genre DROP FOREIGN KEY FK_GenreID;
ALTER TABLE Console_Games DROP FOREIGN KEY FK_GameCID;
ALTER TABLE Console_Games DROP FOREIGN KEY FK_ConsoleID;
ALTER TABLE Owned_Games DROP FOREIGN KEY FK_Owner;
ALTER TABLE Owned_Games DROP FOREIGN KEY FK_Game;

DROP TABLE IF EXISTS Owner_Information, Console, Genre, Game_Information, Game_Genre, Console_Games, Owned_Games;

-- Create Video Game Database
CREATE TABLE Owner_Information (
    Owner_ID int AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    FName varchar(15),
    LName varchar(15),
    Interests varchar(200),
    Consoles_Owned varchar(200)
);

CREATE TABLE Console (
    Console_ID int AUTO_INCREMENT PRIMARY KEY,
    Console_Name varchar(15),
    Release_Year int
);

CREATE TABLE Genre (
    Genre_ID int AUTO_INCREMENT PRIMARY KEY,
    Genre_Name varchar(25)
);

CREATE TABLE Game_Information (
    Game_ID int AUTO_INCREMENT PRIMARY KEY, 
    Game_Name varchar(50),
    Physical_Digital varchar(10),
    Release_Year int
);

--Game Genres Added because changed to auto increment for the IDs
--Both are foreign keys
CREATE TABLE Game_Genre (
    Game_ID int NOT NULL,
    Genre_ID int NOT NULL,
    PRIMARY KEY (Game_ID, Genre_ID)
);

--Add Console_Games table to connect them with the IDs because of auto increment 
--Both are foreign keys
CREATE TABLE Console_Games (
    Game_ID int NOT NULL,
    Console_ID int NOT NULL,
    PRIMARY KEY (Game_ID, Console_ID)
);

--Owner_ID adn Game_ID are foreign keys 
CREATE TABLE Owned_Games (
    Owned_Games_ID int AUTO_INCREMENT PRIMARY KEY,
    Owner_ID int,
    Game_ID int
);

ALTER TABLE Game_Genre ADD CONSTRAINT FK_GameID FOREIGN KEY (Game_ID) REFERENCES Game_Information(Game_ID);
ALTER TABLE Game_Genre ADD CONSTRAINT FK_GenreID FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID);
ALTER TABLE Console_Games ADD CONSTRAINT FK_GameCID FOREIGN KEY (Game_ID) REFERENCES Game_Information(Game_ID);
ALTER TABLE Console_Games ADD CONSTRAINT FK_ConsoleID FOREIGN KEY (Console_ID) REFERENCES Console(Console_ID);
ALTER TABLE Owned_Games ADD CONSTRAINT FK_Owner FOREIGN KEY (Owner_ID) REFERENCES Owner_Information(Owner_ID);
ALTER TABLE Owned_Games ADD CONSTRAINT FK_Game FOREIGN KEY (Game_ID) REFERENCES Game_Information(Game_ID);
