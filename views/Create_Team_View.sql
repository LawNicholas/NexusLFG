CREATE VIEW create_team AS
SELECT game.gamename, mode.modename, region.regionname FROM game
JOIN mode ON game.gameid=mode.gameid
JOIN region ON game.gameid=region.gameid;