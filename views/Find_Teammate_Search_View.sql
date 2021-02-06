CREATE VIEW find_teammate_search AS
SELECT game.gamename, mode.modename, rank.rankname, role.rolename, region.regionname FROM game
JOIN mode ON game.gameid = mode.gameid
JOIN rank ON game.gameid = rank.gameid
JOIN role ON game.gameid = role.gameid
JOIN region ON game.gameid = region.gameid;