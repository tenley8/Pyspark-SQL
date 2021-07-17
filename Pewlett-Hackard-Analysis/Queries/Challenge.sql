--Number of [titles] Retiring
SELECT ri.emp_no,
ri.first_name,
ri.last_name,
ti.title,
ti.from_date,
s.salary
INTO titles_retiring
FROM retirement_info as ri
RIGHT JOIN titles AS ti
ON (ri.emp_no = ti.emp_no)
INNER JOIN salaries AS s
ON (ri.emp_no = s.emp_no)

SELECT * FROM titles_retiring;

--Most Recent Titles
SELECT
  titles_retiring.first_name,
  titles_retiring.last_name,
  string_agg(titles_retiring.title, ' / ') AS titles,
  titles_retiring.from_date
INTO recent_titles
FROM titles_retiring
GROUP BY
  titles_retiring.first_name,
  titles_retiring.last_name,
  titles_retiring.from_date
ORDER BY from_date DESC;

SELECT * FROM recent_titles

--Ready for a Mentor
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
e.birth_date,
e.hire_date,
ti.to_date 
INTO mentor_ready
FROM employees as e
LEFT JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (ti.to_date = '9999-01-01');

SELECT * FROM mentor_ready;
