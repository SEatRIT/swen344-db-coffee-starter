DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS reviewers;
DROP TABLE IF EXISTS roast_curve_points;
DROP TABLE IF EXISTS roasts;
DROP TABLE IF EXISTS roast_curves;
DROP TABLE IF EXISTS bean_batch;
DROP TYPE IF EXISTS likert;

CREATE TYPE likert AS ENUM (
  'Strongly Agree',
  'Agree',
  'Neutral',
  'Disagree',
  'Strongly Disagree'
);

CREATE TABLE reviewers(
  id          SERIAL PRIMARY KEY,
  username    TEXT UNIQUE NOT NULL
);

CREATE TABLE roast_curves(
  id          SERIAL PRIMARY KEY,
  nickname    TEXT UNIQUE NOT NULL
);

CREATE TABLE roast_curve_points(
  id              SERIAL PRIMARY KEY,
  temp            DECIMAL NOT NULL,
  at_time_s       INTEGER NOT NULL,
  roast_curve_id  INTEGER REFERENCES roast_curves(id)
);

CREATE TABLE bean_batch(
  id          SERIAL PRIMARY KEY,
  origin      TEXT NOT NULL,
  name        TEXT NOT NULL,
  received    TIMESTAMP
);

CREATE TABLE roasts(
  id              SERIAL PRIMARY KEY,
  roast_curve_id  INTEGER NOT NULL REFERENCES roast_curves(id),
  bean_batch_id   INTEGER NOT NULL REFERENCES bean_batch(id),
  ambient_temp    DECIMAL NOT NULL,
  humidity        DECIMAL NOT NULL
);

CREATE TABLE reviews(
  id          SERIAL PRIMARY KEY,
  reviewer_id INTEGER NOT NULL REFERENCES reviewers(id),
  roast_id    INTEGER NOT NULL REFERENCES roasts(id),
  score       DECIMAL NOT NULL,
  nice_day    likert DEFAULT 'Neutral',
  acidic      likert DEFAULT 'Neutral',
  aroma       likert DEFAULT 'Neutral',
  bitterness  likert DEFAULT 'Neutral',
  aftertaste  likert DEFAULT 'Neutral',
  taste_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
