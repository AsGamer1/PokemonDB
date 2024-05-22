--Function to retrieve a Pokemon's stats by Pokemon ID

CREATE OR REPLACE FUNCTION get_pokemon_stats(p_id int)
RETURNS TABLE(stat_name name, stat_value int) AS $$
BEGIN
    RETURN QUERY
    SELECT s.stat_name, ps.value
    FROM pokemon_stat ps
    JOIN stat s ON ps.stat_id = s.stat_id
    WHERE ps.pokemon_id = p_id;
END;
$$ LANGUAGE plpgsql;

--Function to get a list of all Pokemon that belong to a specific generation

CREATE OR REPLACE FUNCTION get_pokemon_by_generation(gen int)
RETURNS TABLE(pokemon_id int, pokemon_name name, pokedex_info text, weight numeric, height numeric) AS $$
BEGIN
    RETURN QUERY
    SELECT p.pokemon_id, s.species_name AS pokemon_name, p.pokedex_info, p.weight, p.height
    FROM pokemon p
    JOIN species s ON p.species_id = s.species_id
    WHERE p.generation = gen;
END;
$$ LANGUAGE plpgsql;

--Function to find the effectiveness multiplier between two types

CREATE OR REPLACE FUNCTION get_effectiveness(attacker int, defender int)
RETURNS numeric AS $$
DECLARE
    multiplier numeric;
BEGIN
    SELECT e.multiplier INTO multiplier
    FROM effectiveness e
    WHERE e.attacker_type_id = attacker AND e.defender_type_id = defender;
    
    IF multiplier IS NULL THEN
        RETURN 1; -- Assuming a default effectiveness multiplier of 1 if no specific entry exists
    ELSE
        RETURN multiplier;
    END IF;
END;
$$ LANGUAGE plpgsql;

--Function to get all abilities of a given Pokemon (including whether they are hidden or not)

CREATE OR REPLACE FUNCTION get_pokemon_abilities(p_id int)
RETURNS TABLE(pokemon_name name, ability_name name, effect text, is_hidden boolean) AS $$
BEGIN
    RETURN QUERY
    SELECT s.species_name AS pokemon_name, a.ability_name, a.effect, pa.is_hidden
    FROM pokemon p
    JOIN species s ON p.species_id = s.species_id
    JOIN pokemon_ability pa ON p.pokemon_id = pa.pokemon_id
    JOIN ability a ON pa.ability_id = a.ability_id
    WHERE pa.pokemon_id = p_id;
END;
$$ LANGUAGE plpgsql;

--Function to retrieve all Pokemon that belong to a specific type

CREATE OR REPLACE FUNCTION get_pokemon_by_type(t_id int)
RETURNS TABLE(pokemon_id int, pokemon_name name, pokedex_info text, weight numeric, height numeric) AS $$
BEGIN
    RETURN QUERY
    SELECT p.pokemon_id, s.species_name AS pokemon_name, p.pokedex_info, p.weight, p.height
    FROM pokemon p
    JOIN pokemon_type pt ON p.pokemon_id = pt.pokemon_id
    JOIN species s ON p.species_id = s.species_id
    WHERE pt.type_id = t_id;
END;
$$ LANGUAGE plpgsql;

