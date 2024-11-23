import sqlite3
from datetime import datetime

connection = sqlite3.connect("school.db")
cursor = connection.cursor()

with open("database_setup.sql", "r") as sql_file:
    cursor.executescript(sql_file.read())

cursor.executemany(
    "INSERT INTO school (name, address, phone_number, davlat_maktabi) VALUES (?, ?, ?, ?)",
    [
        ("School A", "Address A", "123456789", True),
        ("School B", "Address B", "987654321", False),
    ],
)

with open("queries.sql", "r") as sql_file:
    for query in sql_file:
        cursor.execute(query)

connection.commit()
connection.close()
