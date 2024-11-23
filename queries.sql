SELECT TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD');

ALTER TABLE school RENAME TO schools;
ALTER TABLE teacher RENAME TO teachers;

ALTER TABLE schools RENAME COLUMN phone_number TO contact_number;
ALTER TABLE student RENAME COLUMN first_name TO fname;
ALTER TABLE student RENAME COLUMN last_name TO lname;

ALTER TABLE schools ADD COLUMN established_year INTEGER;
ALTER TABLE student ADD COLUMN grade_level TEXT;

ALTER TABLE attendance DROP COLUMN date;

UPDATE student SET fname = 'UpdatedName' WHERE id = 1;
UPDATE schools SET contact_number = '000000000' WHERE id = 1;
UPDATE teachers SET first_name = 'UpdatedTeacher' WHERE id = 1;
UPDATE teachers SET email = 'updated@example.com' WHERE id = 2;

DELETE FROM student WHERE id = 1;
DELETE FROM schools WHERE id = 1;
DELETE FROM teachers WHERE id = 1;
DELETE FROM class WHERE id = 1;
