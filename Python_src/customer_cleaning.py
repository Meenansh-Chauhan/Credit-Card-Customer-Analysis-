import pandas as pd

df = pd.read_csv("Credit_card.csv")
df = df.iloc[1:]
df.columns = df.columns.str.lower()

df.rename(columns={'ind_id':'id','annual_income':'income','birthday_count':'age','employed_days':'days_employed'},inplace=True)
df["type_occupation"]=df["type_occupation"].fillna("Unknown")
df["age"]= df["age"].fillna(df["age"].median())
df["gender"]=df["gender"].fillna("Unknown")

df["age"]= df["age"].abs()
df["days_employed"]= df["days_employed"].abs()

df["age"]=(df["age"]/365).astype("int32")
df["days_employed"]=(df["days_employed"]/365).astype("int32")

# print(df.head())
# print(df.info())
# print(df.columns)
# print(df.isnull().sum())
# print(df["email_id"].value_counts())

# def print_unique_values(dataframe):
#     print("Unique values per column:")
#     for col in dataframe.columns:
#         print(f"--- {col} ---")
#         print(dataframe[col].unique())
#         print(dataframe[col].describe())
#         print()
# print_unique_values(df)

df.to_csv("Clean_Customer.csv", index=False)
print("Saved to Clean_Customer.csv")