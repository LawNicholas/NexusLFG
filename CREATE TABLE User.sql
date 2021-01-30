CREATE TABLE User
(
  UserId SERIAL,
  UserName VARCHAR NOT NULL,
  Email VARCHAR NOT NULL,
  Password VARCHAR NOT NULL,
  PRIMARY KEY (UserId)
);

CREATE TABLE Game
(
  TeamSize INT NOT NULL,
  GameName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (GameId),
  UNIQUE (GameName)
);

CREATE TABLE Role
(
  RoleName VARCHAR NOT NULL,
  RoleId SERIAL,
  GameId SERIAL,
  PRIMARY KEY (RoleId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE Region
(
  RegionId SERIAL,
  RegionName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (RegionId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE Rank
(
  RankId SERIAL,
  RankName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (RankId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE Mode
(
  ModeId SERIAL,
  ModeName VARCHAR NOT NULL,
  GameId SERIAL,
  PRIMARY KEY (ModeId),
  FOREIGN KEY (GameId) REFERENCES Game(GameId)
);

CREATE TABLE Team
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

CREATE TABLE Game_Profile
(
  ProfileId SERIAL,
  UserId SERIAL,
  RoleId SERIAL,
  RegionId SERIAL,
  RankId SERIAL,
  ModeId SERIAL,
  PRIMARY KEY (ProfileId),
  FOREIGN KEY (UserId) REFERENCES User(UserId),
  FOREIGN KEY (RoleId) REFERENCES Role(RoleId),
  FOREIGN KEY (RegionId) REFERENCES Region(RegionId),
  FOREIGN KEY (RankId) REFERENCES Rank(RankId),
  FOREIGN KEY (ModeId) REFERENCES Mode(ModeId)
);

CREATE TABLE Is_Member_of
(
  IsTeamLeader INT NOT NULL,
  ProfileId SERIAL,
  TeamId SERIAL,
  PRIMARY KEY (ProfileId, TeamId),
  FOREIGN KEY (ProfileId) REFERENCES Game_Profile(ProfileId),
  FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);