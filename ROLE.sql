CREATE ROLE professor WITH LOGIN;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO professor;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO professor;
GRANT ALL PRIVILEGES ON ALL PROCEDURES IN SCHEMA public TO professor;
GRANT ALL PRIVILEGES ON SCHEMA public TO professor;


CREATE ROLE breeder WITH LOGIN;
GRANT SELECT, INSERT, UPDATE ON TABLE pokemon TO breeder;
GRANT SELECT, INSERT, UPDATE ON TABLE species TO breeder;
GRANT SELECT, INSERT, UPDATE ON TABLE pokemon_type TO breeder;
GRANT SELECT, INSERT, UPDATE ON TABLE pokemon_ability TO breeder;
GRANT SELECT, INSERT, UPDATE ON TABLE pokemon_stat TO breeder;
GRANT EXECUTE ON PROCEDURE type_change, update_pokemon_weight_and_height TO breeder;


CREATE ROLE professors_assistant WITH LOGIN;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO professors_assistant;
GRANT EXECUTE ON FUNCTION get_pokemon_stats, get_pokemon_by_generation, get_effectiveness, get_pokemon_abilities, get_pokemon_by_type TO professors_assistant;


CREATE ROLE bug_catcher WITH LOGIN;
GRANT SELECT ON TABLE pokemon TO bug_catcher;
GRANT SELECT ON TABLE species TO bug_catcher;
GRANT SELECT ON TABLE type TO bug_catcher;
GRANT SELECT ON TABLE ability TO bug_catcher;
GRANT SELECT ON TABLE game TO bug_catcher;
GRANT SELECT ON TABLE pokedex TO bug_catcher;

CREATE USER oak PASSWORD 'memolanlospokes';
CREATE USER red PASSWORD 'soyelchampion';
CREATE USER toni PASSWORD 'elgobiernomeroba';
CREATE USER alex PASSWORD 'mepasaoeljuego';
CREATE USER pingo PASSWORD 'miramimetapod'

GRANT professor TO oak;
GRANT breeder TO red;
GRANT professors_assistant TO toni, alex;
GRANT bug_catcher TO pingo;
