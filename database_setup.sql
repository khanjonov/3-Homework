CREATE TABLE school (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    phone_number CHAR(15),
    davlat_maktabi BOOLEAN
);

CREATE TABLE teacher (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT,
    phone_number CHAR(15),
    school_id INTEGER,
    FOREIGN KEY (school_id) REFERENCES school (id)
);

CREATE TABLE student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth DATE,
    gender TEXT,
    school_id INTEGER,
    FOREIGN KEY (school_id) REFERENCES school (id)
);

CREATE TABLE class (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    teacher_id INTEGER,
    school_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teacher (id),
    FOREIGN KEY (school_id) REFERENCES school (id)
);

CREATE TABLE subject (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    class_id INTEGER,
    teacher_id INTEGER,
    FOREIGN KEY (class_id) REFERENCES class (id),
    FOREIGN KEY (teacher_id) REFERENCES teacher (id)
);

CREATE TABLE enrollment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    class_id INTEGER,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (class_id) REFERENCES class (id)
);

CREATE TABLE grade (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER,
    grade_value INTEGER,
    date_given DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (subject_id) REFERENCES subject (id)
);

CREATE TABLE attendance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    class_id INTEGER,
    date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (class_id) REFERENCES class (id)
);
