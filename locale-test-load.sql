BEGIN;

DROP TABLE IF EXISTS locale_test;
CREATE TABLE locale_test (words character varying(255));

INSERT INTO locale_test (words) VALUES ('truck');
INSERT INTO locale_test (words) VALUES ('lorrie');
INSERT INTO locale_test (words) VALUES ('wampeter');
INSERT INTO locale_test (words) VALUES ('filibuster');
INSERT INTO locale_test (words) VALUES ('chips');

COMMIT;
