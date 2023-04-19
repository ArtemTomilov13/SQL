USE staff;
CREATE TABLE staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(20),
lastname VARCHAR(20),
post VARCHAR(20),
seniority INT,
salary INT,
age INT
);
INSERT INTO staff(id, firstname, lastname, post, seniority, salary, age)
VALUES
(1, "Вася", "Петров", "Начальник", 40, 100000, 60),
(2, "Петр",	"Власов", "Начальник",	8,	70000,	30),
(3, "Катя",	"Катина", "Инженер", 2,	70000,	25),
(4, "Саша",	"Сасин", "Инженер",	12,	50000, 35),
(5,	"Иван",	"Иванов", "Рабочий", 40, 30000, 59),
(6,	"Петр",	"Петров", "Рабочий", 20, 25000,	40),
(7,	"Сидр",	"Сидоров",	"Рабочий", 10, 20000, 35),
(8,	"Антон", "Антонов",	"Рабочий", 8, 19000, 28),
(9,	"Юрий",	"Юрков", "Рабочий", 5, 15000, 25),
(10, "Максим", "Максимов", "Рабочий", 2, 11000, 22),
(11, "Юрий", "Галкин",	 "Рабочий", 3, 12000, 24),
(12, "Людмила",	"Маркина", "Уборщик", 10, 10000, 49);

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке убывания:
SELECT *
FROM staff
ORDER BY salary DESC;
-- 2. Отсортируйте данные по полю заработная плата (salary) в порядке возрастания:
SELECT *
FROM staff
ORDER BY salary;
-- 3. Выведите 5 максимальных заработных плат (saraly)
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;
-- 4. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT 
	post,
    SUM(salary) AS sum_salary
FROM staff
GROUP BY post;
-- 5. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT
	COUNT(id) AS count_id
FROM staff
WHERE post = "Рабочий" AND age > 24 AND age <= 49;
-- 6. Найдите количество специальностей
SELECT 
	COUNT(DISTINCT post) AS count_post
FROM staff;
-- 7. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT
	post
FROM staff
GROUP BY post
HAVING AVG(age) < 30;
