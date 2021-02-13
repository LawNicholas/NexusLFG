CREATE VIEW create_team_region AS
SELECT game.gamename, region.regionname FROM game
JOIN region ON game.gameid=region.gameid;