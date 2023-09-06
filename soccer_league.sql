-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255)
);

CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Goals (
    goal_id INT PRIMARY KEY,
    game_id INT,
    player_id INT,
    goal_time TIMESTAMP,
    FOREIGN KEY (game_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE TABLE Referees (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(255)
);

CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    match_result VARCHAR(255),
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Seasons (
    season_id INT PRIMARY KEY,
    season_name VARCHAR(255),
    start_date DATE,
    end_date DATE
);

CREATE TABLE Standings (
    standings_id INT PRIMARY KEY,
    season_id INT,
    team_id INT,
    wins INT,
    losses INT,
    draws INT,
    points INT,
    rank INT,
    FOREIGN KEY (season_id) REFERENCES Seasons(season_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);