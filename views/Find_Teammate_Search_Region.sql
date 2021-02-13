CREATE VIEW find_teammate_search_region AS
SELECT game.gamename, region.regionname FROM game
JOIN region ON game.gameid = region.gameid;