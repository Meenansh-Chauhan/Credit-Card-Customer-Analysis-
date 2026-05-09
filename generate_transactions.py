import numpy as np
import pandas as pd
import random
from datetime import datetime, timedelta

#this file will be used for generating transaction for customer, with messy- uncleadned data

# Loading Clean_Customer.csv
df = pd.read_csv("Clean_Customer.csv")

# print(df.head())

customers_ids = df["id"].tolist()
# print(len(customers_ids))

categories = [
    "Food", "food", "Travel", "travel ",
    "Shopping",  "Bills", "bills",
    "Entertainment", "entertainment", None
]

transactions_data = []

for i in range(1800):
    customer = random.choice(customers_ids)
    
    amount = round(np.random.uniform(50, 10000), 2)
    
    category = random.choice(categories)
    
    start_date = datetime(2023, 1, 1)
    date = start_date + timedelta(days=random.randint(0, 365))
    
    transactions_data.append([i, customer, amount, category, date])

transactions = pd.DataFrame(transactions_data, columns=["id", "customer_id", "amount", "category", "date"])

# print(transactions.head())
# print(len(transactions))

for idx in transactions.sample(frac=0.05).index:
    transactions.loc[idx, "amount"]= None

for idx in transactions.sample(frac=0.02).index:
    transactions.loc[idx, "amount"]= -1000

# duplicate some rows
duplicates = transactions.sample(50)
transactions = pd.concat([transactions, duplicates], ignore_index=True)

print(transactions.describe())

print("Total rows after duplicates:", len(transactions))
print(transactions["amount"].isnull().sum())
print((transactions["amount"] < 0).sum())

transactions.to_csv("transactions_raw.csv", index=False)

print("Transactions dataset saved!")