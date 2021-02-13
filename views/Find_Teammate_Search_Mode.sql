CREATE VIEW find_teammate_search_mode AS
SELECT game.gamename, mode.modename FROM game
JOIN mode ON game.gameid = mode.gameid;