import psycopg2
import os
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(
    dbname=os.environ.get('DB_NAME', 'postgres'),
    user=os.environ.get('DB_USER', 'postgres'),
    password=os.environ.get('DB_PASSWORD', 'your_password_here'),
    host=os.environ.get('DB_HOST', 'localhost'),
    port=os.environ.get('DB_PORT', '5432')
)

conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

cursor = conn.cursor()

try:
    cursor.execute("CREATE DATABASE credit_analysis")
    print("Database 'credit_analysis'created successfully!")
except psycopg2.errors.DuplicateDatabase:
    print("Database 'credit_analysis'already exists.")
cursor.close()
conn.close()
