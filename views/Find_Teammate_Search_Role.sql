CREATE VIEW find_teammate_search_role AS
SELECT game.gamename, role.rolename FROM game
JOIN role ON game.gameid = role.gameid;