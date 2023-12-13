-- Индексируем таблицу с соискателями по наиболее частым фильтрам - региону и полу (в части вакансий могут требоваться исключительно мужчины или женщины)
CREATE INDEX employee_area_id_idx ON employee (area_id);
CREATE INDEX employee_gender_idx ON employee (gender);

-- Индексируем таблицу с откликами по всем внешним ключам (для ускорения фильтрации в запросах)
CREATE INDEX response_employee_id_idx ON response (employee_id);
CREATE INDEX response_vacancy_id_idx ON response (vacancy_id);
CREATE INDEX response_negotiations_status_id_idx ON response (negotiations_status_id);

-- Индексируем таблицу с резюме по регионам и специализациям - для фильтрации работодателями резюме по основным критериям соответствия
CREATE INDEX resume_area_id_idx ON resume (area_id);
CREATE INDEX resume_specialization_id_idx ON resume (specialization_id);

-- Индексируем таблицу с вакансиями по регионам, специализациям и работодателям - аналогично таблице с резюме
CREATE INDEX vacancy_area_id_idx ON vacancy (area_id);
CREATE INDEX vacancy_specialization_id_idx ON vacancy (specialization_id);
CREATE INDEX vacancy_employer_id_idx ON vacancy (employer_id);
