CREATE TABLE species (
  species_id   int  NOT NULL  PRIMARY KEY,
  species_name name
);
CREATE TABLE stat (
  stat_id   int  NOT NULL  PRIMARY KEY,
  stat_name name
);
CREATE TABLE form (
  form_id   int  NOT NULL  PRIMARY KEY,
  form_name name
);
CREATE TABLE gender (
  gender_id   int  NOT NULL  PRIMARY KEY,
  gender_name name
);
CREATE TABLE ability (
  ability_id   int  NOT NULL  PRIMARY KEY,
  ability_name name,
  effect       text
);
CREATE TABLE region (
  region_id   int  NOT NULL  PRIMARY KEY,
  region_name name
);
CREATE TABLE type (
  type_id   int  NOT NULL  PRIMARY KEY,
  type_name name
);
CREATE TABLE game (
  game_id    int  NOT NULL  PRIMARY KEY,
  game_name  name,
  generation int,
  release_year smallint
);
CREATE TABLE pokedex (
  pokedex_id    int NOT NULL  PRIMARY KEY,
  pokedex_name  name
);
CREATE TABLE pokemon (
  pokemon_id   int     NOT NULL  PRIMARY KEY,
  pokedex_info text,
  weight       numeric,
  height       numeric,
  generation   int,
  evolves_from int                REFERENCES pokemon(pokemon_id),
  species_id    int     NOT NULL  REFERENCES species(species_id)
);
CREATE TABLE effectiveness (
  attacker_type_id  int     NOT NULL  REFERENCES type(type_id),
  defender_type_id  int     NOT NULL  REFERENCES type(type_id),
  multiplier        numeric,
  PRIMARY KEY (attacker_type_id, defender_type_id)
);
CREATE TABLE game_region (
  game_id   int NOT NULL  REFERENCES game(game_id),
  region_id int NOT NULL  REFERENCES region(region_id),
  PRIMARY KEY (region_id, game_id)
);
CREATE TABLE pokemon_stat (
  pokemon_id int NOT NULL  REFERENCES pokemon(pokemon_id),
  stat_id    int NOT NULL  REFERENCES stat(stat_id),
  value      int,
  PRIMARY KEY (pokemon_id, stat_id)
);
CREATE TABLE pokemon_form (
  pokemon_id int NOT NULL  REFERENCES pokemon(pokemon_id),
  form_id    int NOT NULL  REFERENCES form(form_id)
);
CREATE TABLE species_gender (
  species_id int NOT NULL  REFERENCES species(species_id),
  gender_id  int NOT NULL  REFERENCES gender(gender_id),
  percentage int,
  PRIMARY KEY (species_id, gender_id)
);
CREATE TABLE pokemon_ability (
  pokemon_id  int     NOT NULL  REFERENCES pokemon(pokemon_id),
  ability_id  int     NOT NULL  REFERENCES ability(ability_id),
  is_hidden   boolean,
  PRIMARY KEY (pokemon_id, ability_id)
);
CREATE TABLE mon_dex_game (
  pokemon_id  int NOT NULL  REFERENCES pokemon(pokemon_id),
  game_id     int NOT NULL  REFERENCES game(game_id),
  pokedex_id  int NOT NULL  REFERENCES pokedex(pokedex_id),
  dex_number  int,
  PRIMARY KEY (pokemon_id, game_id, pokedex_id)
);
CREATE TABLE pokemon_type (
  pokemon_id    int NOT NULL  REFERENCES pokemon(pokemon_id),
  type_id int NOT NULL  REFERENCES type(type_id),
  PRIMARY KEY (pokemon_id, type_id)
);