CREATE OR REPLACE FUNCTION trigger_set_ispublic()
RETURNS TRIGGER AS $$
BEGIN
  NEW.ispublic = 0;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;