import os
import psycopg2 
import pandas as pd

conn = psycopg2.connect(
    dbname=os.environ.get("DB_NAME", "credit_analysis"),
    user=os.environ.get("DB_USER", "postgres"),
    password=os.environ.get("DB_PASSWORD", "your_password_here"),
    host=os.environ.get("DB_HOST", "Localhost"),
    port=os.environ.get("DB_PORT", "5432"),
)

cursor = conn.cursor()

df=pd.read_csv("")