SELECT extract(MONTH FROM created) AS "Месяц",
       extract(YEAR FROM created) AS "Год",
       count(*)
FROM vacancy
GROUP BY extract(MONTH FROM created),
         extract(YEAR FROM created)
ORDER BY COUNT DESC
LIMIT 1;

SELECT extract(MONTH FROM created) AS "Месяц",
       extract(YEAR FROM created) AS "Год",
       count(*)
FROM resume
GROUP BY extract(MONTH FROM created),
         extract(YEAR FROM created)
ORDER BY COUNT DESC
LIMIT 1;

