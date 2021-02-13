CREATE VIEW find_teammate_search_rank AS
SELECT game.gamename, rank.rankname FROM game
JOIN rank ON game.gameid = rank.gameid;