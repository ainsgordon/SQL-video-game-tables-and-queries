
--Ainsley Gordon Milestone3 Queries

--Nested Queries:
-- SELECT Game_Information.Game_Name as RolePlaying_Games FROM Game_Information NATURAL JOIN Owned_Games WHERE Game_Information.Game_ID in (SELECT Game_Information.Game_ID 
-- FROM Game_Information 
-- left outer join Game_Genre 
-- on Owned_Games.Genre_ID = Game_Genre.Genre_ID left outer join Genres on Game_Genre.Genre_ID = Genre.Genre_ID
-- WHERE Genre.Genre_Name ='Role-Playing');

SELECT Game_Information.Game_Name as Seths_Games FROM Game_Information WHERE Game_Information.Game_ID in (SELECT Owned_Games.Game_ID FROM Owned_Games left outer join Owner_Information on Owned_Games.Owner_ID = Owner_Information.Owner_ID WHERE LName ='Embrey');

--Given Query
SELECT CONCAT(FName, ' ', LName), GROUP_CONCAT(Game_Name ORDER BY Game_Name DESC SEPARATOR ',') FROM Owner_Information NATURAL JOIN Owned_Games NATURAL JOIN Game_Information GROUP BY FName ORDER BY LName ASC;

SELECT Game_Information.Game_Name as RolePlaying_Games 
FROM Game_Information 
NATURAL JOIN Owned_Games 
LEFT OUTER JOIN Game_Genre 
on Game_Information.Game_ID = Game_Genre.Game_ID 
LEFT OUTER JOIN Genre 
on Genre.Genre_ID = Game_Genre.Genre_ID 
WHERE Genre.Genre_Name = 'Role-Playing';

SELECT Game_Information.Game_Name as RolePlaying_Games FROM Game_Information NATURAL JOIN Owned_Games WHERE Game_Information.Game_ID in (SELECT Game_Information.Game_ID FROM Game_Information NATURAL JOIN Game_Genre LEFT OUTER JOIN Genre on Genre.Genre_ID = Game_Genre.Genre_ID WHERE Genre.Genre_Name = 'Role-Playing');
