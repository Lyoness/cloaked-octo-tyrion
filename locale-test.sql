SELECT words FROM locale_test ORDER BY words DESC;

SELECT (words COLLATE "en_US") FROM locale_test ORDER BY words DESC;

BEGIN;
  SELECT (words COLLATE "en_GB") FROM locale_test ORDER BY words DESC;
COMMIT;

BEGIN;
  CREATE COLLATION "en_GB" (LOCALE = 'en_GB');
  SELECT (words COLLATE "en_GB") FROM locale_test ORDER BY words DESC;
  DROP COLLATION "en_GB";
COMMIT;
