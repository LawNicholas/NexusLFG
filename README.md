# NEXUSLFG
Contributors:  \
  Nicholas Law \
  Colin Rampton \
  Jordan Golden

## API Documentation
Database uses PostgREST as a RESTful API.

To connect to the API, make all http requsts to endpoints beginning with http://192.168.50.61:8000. To modify table data, a token must be passed in the header using the "Authorization" keyword.  The value should contain "Bearer " followed by the token value.  The token is returned from the /rpc/login endpoint.

### Registration
To register a user, make a POST request to the /rpc/signup endpoint.  The body contains three key-value pairs
* email - The unique email of the user (used for login)
* password - The password of the user (will be hashed and salted)
* name - The username to be used for the account (will be stored in the user_profile table as well)

If the email hasn't been registered previously, then the profile will be created.

### Login
To login a user, make a POST request to the /rpc/login endpoint.  The body contains two key-value pairs
* email - The email of the user trying to login
* password - Password created during registration (must match value stored in the database after hashing)

If the values match what is stored in the database, a token will be returned in the response which must be used to modify table values.

### Security
Within the API there are two roles, Admin and Anonymous.  Anonymous is a role assigned to any unauthenticated user interacting with the database.  Permissions have been limited to only SELECT statements meaning only GET requests will be returned successfully.  When a user authenticates via the steps listed above, they will assigned the role Admin which will allow them access to CREATE, INSERT, UPDATE, and DELETE on the database tables.  Http requests such as POST, PATCH, and DELETE will also become available via the use of the unique token.

## Project Updates
2021.2.13
* Updated faulty views.
* Created GET requests for each View.
* Created Stored Procedure and Trigger which auto-sets ispublic to 0 for a newly created team.

2021.2.6
* Created a folder for View queries.
* Built Views related to each of our prototype pages.

2021.1.30
* PostgreSQL installed on Ubuntu 18.04 server.
* dbuser created as superuser for Postgres.
* pgAdmin installed locally and connected to server.
* CREATE TABLE script used to build database tables.
* Migration scripts tested and found functional.