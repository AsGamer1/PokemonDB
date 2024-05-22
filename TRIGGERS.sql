--This trigger ensures that the stat values for Pokémon are within a valid range (e.g., 0 to 255) whenever an insert or update operation is performed on the pokemon_stat table.

CREATE OR REPLACE FUNCTION validate_stat_value()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.value < 0 OR NEW.value > 255 THEN
        RAISE EXCEPTION 'Stat value % is out of range (0-255)', NEW.value;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_stat_value
BEFORE INSERT OR UPDATE ON pokemon_stat
FOR EACH ROW
EXECUTE FUNCTION validate_stat_value();


--Ensures that the weight and height of the Pokémon are positive values.

CREATE OR REPLACE FUNCTION check_pokemon_weight_height()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.weight <= 0 THEN
        RAISE EXCEPTION 'Weight must be a positive value.';
    END IF;
    
    IF NEW.height <= 0 THEN
        RAISE EXCEPTION 'Height must be a positive value.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_weight_height
BEFORE INSERT OR UPDATE ON pokemon
FOR EACH ROW
EXECUTE FUNCTION check_pokemon_weight_height();


--Checks if the Pokémon already has an entry for the given type and prevents duplicates.

CREATE OR REPLACE FUNCTION prevent_duplicate_pokemon_type()
RETURNS TRIGGER AS $$
DECLARE
    type_count int;
BEGIN
    -- Check for duplicate types
    SELECT COUNT(*)
    INTO type_count
    FROM pokemon_type
    WHERE pokemon_id = NEW.pokemon_id
    AND type_id = NEW.type_id;

    -- If a duplicate is found, raise an exception
    IF type_count > 0 THEN
        RAISE EXCEPTION 'A Pokémon cannot have duplicate types.';
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_duplicate_type
BEFORE INSERT ON pokemon_type
FOR EACH ROW
EXECUTE FUNCTION prevent_duplicate_pokemon_type();
