CREATE TABLE IF NOT EXISTS gaming_ranking (
   game_id VARCHAR,
   score INT,
   player_id VARCHAR,
   hit_date TIMESTAMP,
   PRIMARY KEY (game_id, score, player_id)
)
WITH CLUSTERING ORDER BY (score DESC, player_id ASC);

CREATE TABLE IF NOT EXISTS gaming_ranking_reverse (
   game_id VARCHAR,
   score INT,
   player_id VARCHAR,
   hit_date TIMESTAMP,
   PRIMARY KEY (game_id, score, player_id)
)
WITH CLUSTERING ORDER BY (score ASC, player_id ASC);

CREATE TABLE IF NOT EXISTS gaming_player_score (
   game_id VARCHAR,
   player_id VARCHAR,
   score INT,
   hit_date TIMESTAMP,
   PRIMARY KEY ((game_id, player_id))
);
