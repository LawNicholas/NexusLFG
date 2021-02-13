CREATE VIEW team_expanded AS
SELECT team.teamname, team.banner, team.icon, team.description, game.gamename, mode.modename, user_profile.username, role.rolename, region.regionname FROM team
JOIN game ON team.gameid = game.gameid
JOIN mode ON team.gameid = mode.modeid
JOIN is_member_of ON team.teamid = is_member_of.teamid
JOIN game_profile ON is_member_of.profileid = game_profile.profileid
JOIN user_profile ON game_profile.userid = user_profile.userid
JOIN role ON role.roleid = game_profile.roleid
JOIN region ON region.regionid = game_profile.regionid;