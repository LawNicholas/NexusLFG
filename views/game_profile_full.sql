CREATE view game_profile_full AS
SELECT game_profile.userid, game_profile.profileid, game.gamename, mode.modename, rank.rankname, region.regionname, role.rolename 
FROM game_profile
JOIN mode ON game_profile.modeid = mode.modeid
JOIN rank ON game_profile.rankid = rank.rankid
JOIN region ON game_profile.regionid = region.regionid
JOIN role ON game_profile.roleid = role.roleid
JOIN game ON mode.gameid = game.gameid;