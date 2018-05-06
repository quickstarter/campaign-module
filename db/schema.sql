-- DROP TABLE projects CASCADE;
-- DROP TABLE levels CASCADE;
-- DROP TABLE users CASCADE;
-- DROP TABLE project_level;
-- DROP TABLE project_user;

--SELECT * FROM pledges WHERE projectid in ... Group by levelid COUNT  -- project - level - total amount of pledges
--INSERT ... INTO pledges INCREMENT or UPDATE numberofbackers IN levels
-- potential queries I would need -- 
-- 1. query for each project (project id)
-- 2. query for getting all levels with the project (level id + project id)
-- 3. query for saving user with project / level / amount of pledge (pledge id + project id + level id)
-- 4. query for incrementing number of backers per project id / per level id (project id + level id)


-- CREATE TABLE projects (
--   id SERIAL PRIMARY KEY,
--   aboutInfo text,
--   numberOfBackers INT
-- );


CREATE TABLE levels (
  id SERIAL PRIMARY KEY,
  projectId INT CONSTRAINT project_level_ref REFERENCES projects (id) ON UPDATE CASCADE ON DELETE CASCADE,
  -- projectLevel INT,
  cutoffAmount INT,
  name VARCHAR(100),
  description TEXT,
  includes JSON,
  estimatedDelivery TIMESTAMP WITH TIME ZONE,
  shipsTo VARCHAR(100),
  numberOfBackers INT,
  maxBackers INT
  -- each project must have at least one level 
);

CREATE TABLE pledges (
  id SERIAL PRIMARY KEY,
  -- username text, (temporary)
  userid INT NOT NULL,
  backedAmount INT, -- amount is not tracked on the website
  projectId INT CONSTRAINT pledge__project_ref REFERENCES projects (id) ON UPDATE CASCADE ON DELETE CASCADE,
  levelId INT CONSTRAINT pledge_level_ref REFERENCES levels (id) ON UPDATE CASCADE ON DELETE CASCADE
);

