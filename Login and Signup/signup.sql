CREATE OR REPLACE FUNCTION
signup(email text, password text, name text) RETURNS VOID
AS $$
  INSERT INTO user_profile (email, password, username) VALUES
    (signup.email, crypt(signup.password, gen_salt('bf', 8)), signup.name);
$$ LANGUAGE sql SECURITY DEFINER;