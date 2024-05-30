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



-- Create generation-specific roles
CREATE ROLE gen1_user WITH LOGIN;
CREATE ROLE gen2_user WITH LOGIN;
CREATE ROLE gen3_user WITH LOGIN;
CREATE ROLE gen4_user WITH LOGIN;
CREATE ROLE gen5_user WITH LOGIN;
CREATE ROLE gen6_user WITH LOGIN;
CREATE ROLE gen7_user WITH LOGIN;
CREATE ROLE gen8_user WITH LOGIN;
CREATE ROLE gen9_user WITH LOGIN;

-- Grant permissions to generation-specific roles
GRANT SELECT ON TABLE pokemon TO gen1_user;
GRANT SELECT ON TABLE pokemon TO gen2_user;
GRANT SELECT ON TABLE pokemon TO gen3_user;
GRANT SELECT ON TABLE pokemon TO gen4_user;
GRANT SELECT ON TABLE pokemon TO gen5_user;
GRANT SELECT ON TABLE pokemon TO gen6_user;
GRANT SELECT ON TABLE pokemon TO gen7_user;
GRANT SELECT ON TABLE pokemon TO gen8_user;
GRANT SELECT ON TABLE pokemon TO gen9_user;

GRANT SELECT ON TABLE species TO gen1_user;
GRANT SELECT ON TABLE species TO gen2_user;
GRANT SELECT ON TABLE species TO gen3_user;
GRANT SELECT ON TABLE species TO gen4_user;
GRANT SELECT ON TABLE species TO gen5_user;
GRANT SELECT ON TABLE species TO gen6_user;
GRANT SELECT ON TABLE species TO gen7_user;
GRANT SELECT ON TABLE species TO gen8_user;
GRANT SELECT ON TABLE species TO gen9_user;

ALTER TABLE pokemon ENABLE ROW LEVEL SECURITY;
ALTER TABLE species ENABLE ROW LEVEL SECURITY;

-- Policies for pokemon table
CREATE POLICY gen1_policy ON pokemon
    FOR SELECT
    TO gen1_user
    USING (generation <= 1);

CREATE POLICY gen2_policy ON pokemon
    FOR SELECT
    TO gen2_user
    USING (generation <= 2);

CREATE POLICY gen3_policy ON pokemon
    FOR SELECT
    TO gen3_user
    USING (generation <= 3);

CREATE POLICY gen4_policy ON pokemon
    FOR SELECT
    TO gen4_user
    USING (generation <= 4);

CREATE POLICY gen5_policy ON pokemon
    FOR SELECT
    TO gen5_user
    USING (generation <= 5);

CREATE POLICY gen6_policy ON pokemon
    FOR SELECT
    TO gen6_user
    USING (generation <= 6);

CREATE POLICY gen7_policy ON pokemon
    FOR SELECT
    TO gen7_user
    USING (generation <= 7);

CREATE POLICY gen8_policy ON pokemon
    FOR SELECT
    TO gen8_user
    USING (generation <= 8);

CREATE POLICY gen9_policy ON pokemon
    FOR SELECT
    TO gen9_user
    USING (generation <= 9);

-- Policies for species table
CREATE POLICY gen1_species_policy ON species
    FOR SELECT
    TO gen1_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 1));

CREATE POLICY gen2_species_policy ON species
    FOR SELECT
    TO gen2_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 2));

CREATE POLICY gen3_species_policy ON species
    FOR SELECT
    TO gen3_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 3));

CREATE POLICY gen4_species_policy ON species
    FOR SELECT
    TO gen4_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 4));

CREATE POLICY gen5_species_policy ON species
    FOR SELECT
    TO gen5_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 5));

CREATE POLICY gen6_species_policy ON species
    FOR SELECT
    TO gen6_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 6));

CREATE POLICY gen7_species_policy ON species
    FOR SELECT
    TO gen7_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 7));

CREATE POLICY gen8_species_policy ON species
    FOR SELECT
    TO gen8_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 8));

CREATE POLICY gen9_species_policy ON species
    FOR SELECT
    TO gen9_user
    USING (species_id IN (SELECT species_id FROM pokemon WHERE generation <= 9));


--Probar que se apliquen las politicas

SET ROLE gen1_user;

SELECT * FROM pokemon;

-- Podemos repetir con cualquier generacion