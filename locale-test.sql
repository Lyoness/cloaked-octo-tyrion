SELECT words FROM locale_test ORDER BY words DESC;

SELECT (words COLLATE "en_US") FROM locale_test ORDER BY words DESC;

SELECT (words COLLATE "en_GB") FROM locale_test ORDER BY words DESC;
