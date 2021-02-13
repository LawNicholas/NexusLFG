CREATE VIEW create_team_mode AS
SELECT game.gamename, mode.modename FROM game
JOIN mode ON game.gameid=mode.gameid;