SELECT vacancy_id, title, count(*)
FROM response JOIN vacancy ON vacancy.id = response.vacancy_id
WHERE response.created - vacancy.created <= INTERVAL '7 days'
GROUP BY vacancy_id, title
HAVING count(*) > 5
ORDER BY count(*) DESC;
