CREATE VIEW find_teammate_results AS
SELECT user_profile.username, game.gamename, mode.modename, rank.rankname, role.rolename, region.regionname FROM user_profile
JOIN game_profile ON user_profile.userid = game_profile.userid
JOIN mode ON game_profile.modeid = mode.modeid
JOIN rank ON game_profile.rankid = rank.rankid
JOIN role ON game_profile.roleid = role.roleid
JOIN region ON game_profile.regionid = region.regionid
JOIN game ON game.gameid = mode.gameid;