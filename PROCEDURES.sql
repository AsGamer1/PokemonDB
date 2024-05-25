--update the pokemon types

CREATE OR REPLACE PROCEDURE type_change(poke int, type1 int, type2 int DEFAULT NULL) AS $$
BEGIN
    -- Update or insert the first type
    IF EXISTS (SELECT 1 FROM pokemon_type WHERE pokemon_id = poke AND type_id = (SELECT type_id FROM pokemon_type WHERE pokemon_id = poke LIMIT 1)) THEN
        UPDATE pokemon_type
        SET type_id = type1
        WHERE pokemon_id = poke
        AND type_id = (SELECT type_id FROM pokemon_type WHERE pokemon_id = poke LIMIT 1);
    ELSE
        INSERT INTO pokemon_type (pokemon_id, type_id)
        VALUES (poke, type1);
    END IF;

    -- If there is a second type, update or insert it
    IF type2 IS NOT NULL THEN
        IF (SELECT COUNT(*) FROM pokemon_type WHERE pokemon_id = poke) > 1 THEN
            UPDATE pokemon_type
            SET type_id = type2
            WHERE pokemon_id = poke
            AND type_id = (SELECT type_id FROM pokemon_type WHERE pokemon_id = poke LIMIT 1 OFFSET 1);
        ELSE
            -- If there is no second type, insert it
            INSERT INTO pokemon_type (pokemon_id, type_id)
            VALUES (poke, type2);
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- USAGE:
-- Update Pokémon with ID 1 to have type 10 and type 18
CALL type_change(1, 10, 18);

-- Update Pokémon with ID 2 to have only type 15
CALL type_change(2, 15);




--update the pokemon weight/height

CREATE OR REPLACE PROCEDURE update_pokemon_weight_and_height(
    poke_id int,
    new_weight numeric,
    new_height numeric
) AS $$
BEGIN
    UPDATE pokemon
    SET weight = new_weight,
        height = new_height
    WHERE pokemon_id = poke_id;
END;
$$ LANGUAGE plpgsql;

-- USAGE:
-- Update the weight and height of the Pokémon with ID 1
CALL update_pokemon_weight_and_height(1, 7.0, 0.5);
