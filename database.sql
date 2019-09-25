-- use postico to create these tables
-- in a database named
-- pet_hotel

CREATE TABLE "owners" (
    id serial PRIMARY KEY,
    "name" VARCHAR (100),
    "number_of_pets" INT
);

CREATE TABLE "pets" (
    id serial PRIMARY KEY,
    "owner_id" INT REFERENCES "owners",
    "pet" VARCHAR (100),
    "breed" VARCHAR (100),
    "color" VARCHAR (50),
    "checked_in" BOOLEAN
);