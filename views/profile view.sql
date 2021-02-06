CREATE VIEW profile AS
SELECT user_profile.username, user_profile.password, user_profile.email, game.gamename, team.teamname, role.rolename, 
FROM user_profile
JOIN game_profile ON user_profile.userid = game_profile.userid
JOIN is_member_of ON game_profile.profileid = is_member_of.profileid
JOIN team ON is_member_of.teamid = team.teamid
JOIN game ON team.gameid = game.gameid
JOIN role ON game_profile.roleid = role.roleid;