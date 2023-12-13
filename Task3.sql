SELECT area.name AS area,
       AVG(CASE WHEN vacancy.compensation_gross = TRUE THEN compensation_from * 0.87 ELSE compensation_from END) AS "После вычета (мин)",
       AVG(CASE WHEN vacancy.compensation_gross = TRUE THEN compensation_to * 0.87 ELSE compensation_to END) AS "После вычета (макс)",
       AVG(CASE WHEN vacancy.compensation_gross = TRUE THEN (compensation_to * 0.87 + compensation_from * 0.87) / 2 ELSE (compensation_to + compensation_from) / 2 END) AS "После вычета (средняя)"
       FROM vacancy
JOIN area ON area.id = vacancy.area_id
GROUP BY area.name;
