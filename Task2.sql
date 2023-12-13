INSERT INTO area (name) VALUES
('Адыгея'),
('Алтай'),
('Алтайский край'),
('Амурская область'),
('Архангельская область'),
('Астраханская область'),
('Башкортостан'),
('Белгородская область'),
('Брянская область'),
('Бурятия'),
('Владимирская область'),
('Волгоградская область'),
('Вологодская область'),
('Воронежская область'),
('Дагестан'),
('Еврейская АО'),
('Забайкальский край'),
('Ивановская область'),
('Ингушетия'),
('Иркутская область'),
('Кабардино-Балкария'),
('Калининградская область'),
('Калмыкия'),
('Калужская область'),
('Камчатский край'),
('Карачаево-Черкессия'),
('Карелия'),
('Кемеровская область'),
('Кировская область'),
('Коми'),
('Костромская область'),
('Краснодарский край'),
('Красноярский край'),
('Курганская область'),
('Курская область'),
('Ленинградская область'),
('Липецкая область'),
('Магаданская область'),
('Марий Эл'),
('Мордовия'),
('Москва'),
('Московская область'),
('Мурманская область'),
('Ненецкий АО'),
('Нижегородская область'),
('Новгородская область'),
('Новосибирская область'),
('Омская область'),
('Оренбургская область'),
('Орловская область'),
('Пензенская область'),
('Пермский край'),
('Приморский край'),
('Псковская область'),
('Ростовская область'),
('Рязанская область'),
('Самарская область'),
('Санкт-Петербург'),
('Саратовская область'),
('Саха (Якутия)'),
('Сахалинская область'),
('Свердловская область'),
('Северная Осетия - Алания'),
('Смоленская область'),
('Ставропольский край'),
('Тамбовская область'),
('Татарстан'),
('Тверская область'),
('Томская область'),
('Тульская область'),
('Тыва'),
('Тюменская область'),
('Удмуртия'),
('Ульяновская область'),
('Хабаровский край'),
('Хакасия'),
('Ханты-Мансийский АО - Югра'),
('Челябинская область'),
('Чеченская республика'),
('Чувашская республика'),
('Чукотский АО'),
('Ямало-Ненецкий АО'),
('Ярославская область'),
('Крым'),
('Севастополь');


INSERT INTO specialization (name) VALUES
('Веб-разработчик'),
('Мобильный разработчик'),
('Тестировщик программного обеспечения'),
('Системный администратор'),
('База данных администратор'),
('Аналитик данных'),
('Инженер по машинному обучению'),
('Специалист по информационной безопасности'),
('DevOps инженер'),
('Инженер по автоматизации тестирования'),
('UX/UI дизайнер'),
('Продуктовый менеджер'),
('IT-консультант'),
('ИТ-архитектор'),
('Инженер по сетям'),
('Системный аналитик'),
('Специалист по обработке больших данных'),
('IT-рекрутер'),
('Технический писатель по IT'),
('Специалист по информационным технологиям в здравоохранении'),
('Программист'),
('Администратор сети'),
('Специалист по информационным системам'),
('Информационный архитектор'),
('Специалист по информационной аналитике'),
('Инженер-исследователь в области компьютерных наук'),
('Специалист по обучению машин'),
('Специалист по цифровой трансформации'),
('Аналитик бизнес-процессов');

INSERT INTO negotiations_status (name) VALUES
('Отклик'),
('Приглашение'),
('Отказ'),
('Скрытый');

WITH employee_data(
id, 
name, 
email, 
area_id
) AS (SELECT generate_series(1, 10000) AS id,
                 md5(random()::text) AS name,
                 md5(random()::text) AS email,
                 (floor(random() * 85) + 1)::int AS area_id)

INSERT INTO employee(
id, 
name, 
email, 
area_id,
gender
) SELECT employee_data.id,
       employee_data.name,
       employee_data.email,
       employee_data.area_id,
	   CASE WHEN random() < 0.5 THEN 'M' ELSE 'F' END AS gender 
FROM employee_data;


WITH employer_data(
id, 
name, 
email, 
area_id
) AS (SELECT generate_series(1, 10000) AS id,
                 md5(random()::text) AS name,
                 md5(random()::text) AS email,
                 (floor(random() * 85) + 1)::int AS area_id)

INSERT INTO employer(
id, 
name, 
email, 
area_id
) SELECT employer_data.id,
       employer_data.name,
       employer_data.email,
       employer_data.area_id	   
FROM employer_data;



WITH vacancy_data(
id, 
title, 
description, 
compensation,
compensation_add, 
created, 
area_id, 
specialization_id, 
employer_id
) AS (SELECT generate_series(1, 10000) AS id,
                 md5(random()::text) AS title,
                 md5(random()::text) AS description,
                 (floor(random() * 100000) + 50000)::int AS compensation,
                 floor(random() * 100000)::int AS compensation_add,
				 DATE '2022-01-01' + (RANDOM() * (CURRENT_DATE - DATE '2022-01-01'))::int AS created,
                 (floor(random() * 85) + 1)::int AS area_id,
                 (floor(random() * 29) + 1)::int AS specialization_id,
                 (floor(random() * 10000) + 1)::int AS employer_id)

INSERT INTO vacancy(
id, 
title, 
description, 
compensation_from, 
compensation_to, 
compensation_gross, 
created, 
area_id, 
specialization_id, 
employer_id
) SELECT vacancy_data.id,
       vacancy_data.title,
       vacancy_data.description,
       vacancy_data.compensation,
       vacancy_data.compensation + vacancy_data.compensation_add,
	   CASE WHEN random() < 0.5 THEN TRUE ELSE FALSE END AS compensation_gross,
       vacancy_data.created,
       vacancy_data.area_id,
       vacancy_data.specialization_id,
       vacancy_data.employer_id	   
FROM vacancy_data;

WITH resume_data(
id, 
description, 
created,
area_id, 
specialization_id, 
employee_id,
salary
) AS (SELECT generate_series(1, 100000) AS id,
                 md5(random()::text) AS description,
				 DATE '2022-01-01' + (RANDOM() * (CURRENT_DATE - DATE '2022-01-01'))::int AS created,
                 (floor(random() * 85) + 1)::int AS area_id,
                 (floor(random() * 29) + 1)::int AS specialization_id,
                 (floor(random() * 10000) + 1)::int AS employee_id,
                 (floor(random() * 100000) + 50000)::int AS salary)
				 
INSERT INTO resume(
id, 
description, 
created,
salary,
area_id, 
specialization_id, 
employee_id
) SELECT resume_data.id,
       resume_data.description,
       resume_data.created,
       resume_data.salary,
       resume_data.area_id,
       resume_data.specialization_id,
       resume_data.employee_id	   	   
FROM resume_data;


WITH response_data(
id, 
created,
vacancy_id,
employee_id,
negotiations_status_id
) AS (SELECT generate_series(1, 200000) AS id,
				 DATE '2022-01-01' + (RANDOM() * (CURRENT_DATE - DATE '2022-01-01'))::int AS created,
                 (floor(random() * 10000) + 1)::int AS vacancy_id,
                 (floor(random() * 10000) + 1)::int AS employee_id,
                 (floor(random() * 4) + 1)::int AS negotiations_status_id)

INSERT INTO response(
id, 
created,
vacancy_id, 
employee_id, 
negotiations_status_id
) SELECT response_data.id,
       response_data.created,
       response_data.vacancy_id,
       response_data.employee_id,
       response_data.negotiations_status_id	   
FROM response_data;