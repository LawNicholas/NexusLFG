CREATE TABLE user_profile
(
  UserId SERIAL,
  UserName VARCHAR NOT NULL,
  Email VARCHAR NOT NULL,
  Password VARCHAR NOT NULL,
  PRIMARY KEY (UserId)
);

CREATE TABLE game
(
  TeamSize INT NOT NULL,
  GameName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (GameId),
  UNIQUE (GameName)
);

CREATE TABLE role
(
  RoleName VARCHAR NOT NULL,
  RoleId SERIAL,
  GameId SERIAL,
  PRIMARY KEY (RoleId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE region
(
  RegionId SERIAL,
  RegionName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (RegionId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE rank
(
  RankId SERIAL,
  RankName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (RankId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE mode
(
  ModeId SERIAL,
  ModeName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (ModeId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE team
(
  TeamId SERIAL,
  TeamName VARCHAR NOT NULL,
  Icon VARCHAR,
  Banner VARCHAR,
  Description VARCHAR,
  IsPublic INT NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (TeamId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE game_profile
(
  ProfileId SERIAL,
  UserId SERIAL,
  RoleId SERIAL,
  RegionId SERIAL,
  RankId SERIAL,
  ModeId SERIAL,
  PRIMARY KEY (ProfileId),
  FOREIGN KEY (UserId) REFERENCES user_profile(UserId),
  FOREIGN KEY (RoleId) REFERENCES Role(RoleId),
  FOREIGN KEY (RegionId) REFERENCES Region(RegionId),
  FOREIGN KEY (RankId) REFERENCES Rank(RankId),
  FOREIGN KEY (ModeId) REFERENCES Mode(ModeId)
);

CREATE TABLE is_member_of
(
  IsTeamLeader INT NOT NULL,
  ProfileId SERIAL,
  TeamId SERIAL,
  PRIMARY KEY (ProfileId, TeamId),
  FOREIGN KEY (ProfileId) REFERENCES Game_Profile(ProfileId),
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);