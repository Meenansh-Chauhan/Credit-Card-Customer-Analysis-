import pandas as pd

df = pd.read_csv("transactions_raw.csv")
df=df.dropna(subset=["amount"])
df["category"]= df["category"].fillna("Unknown")
df = df[df["amount"]>0]
df = df.drop_duplicates(subset=["id"])
df["category"]= df["category"].str.strip().str.capitalize()
df["date"] = pd.to_datetime(df["date"])
df["month"]= df["date"].dt.month
df["weekday"]= df["date"].dt.day_name()
df["day"]= df["date"].dt.day
df.to_csv("Clean_Transaction.csv", index= False)

# print(df.isnull().sum())
# print ((df["amount"]<0).sum())
# print(df.duplicated().sum())
# # print(df.count())
# print(df["category"].unique())
# print(df.info())
# print(df["date"].dtype)
print("data frame saved to CSV")