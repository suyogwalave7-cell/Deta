import pandas as pd

df = pd.read_csv("data/bank_transactions.csv")

print(df.head())
print("Dataset Shape:", df.shape)

print("Dataset Info:")
df.info()
print(df.describe())
print("missing values")
print(df.isnull().sum())
print("duplicate rows", df.duplicated().sum())
print("transaction types:")
print(df["Transaction_Type"].value_counts())
print("payment mode:")
print(df["Payment_Mode"].value_counts())
print("Account type:")
print(df["Account_Type"].value_counts())
print("Customer Segments:")
print(df["Customer_Segment"].value_counts())
print("Gender:")
print(df["Gender"].value_counts())
print("Loan Status:")
print(df["Loan_Status"].value_counts())
print("Amount Analysis:")
print("Total Amount:", df["Amount"].sum())
print("Average Amount:", df["Amount"].mean())
print("Maximum Amount:", df["Amount"].max())
print("Minimum Amount:", df["Amount"].min())
print("Transaction Type Amount:")
print(df.groupby("Transaction_Type")["Amount"].sum())
print("Branch Wise Transaction Count:")
print(df["Branch"].value_counts())
print("Branch Wise Total Amount:")
print(df.groupby("Branch")["Amount"].sum().sort_values(ascending=False))
print("Top 5 Branches by Amount:")
print(
    df.groupby("Branch")["Amount"]
    .sum()
    .sort_values(ascending=False)
    .head(5)
)
print(
    df.groupby("State")["Amount"]
    .sum()
    .sort_values(ascending=False)
    .head(5)
)
df["Transaction_Date"] = pd.to_datetime(df["Transaction_Date"])
print(df.dtypes)

df["Year"] = df["Transaction_Date"].dt.year
print("Year Wise Transaction Count:")
print(df["Year"].value_counts().sort_index())

print("Amount Analysis:")
print("Total Amount:",df["Amount"].sum())
print("Average Amount:",df["Amount"].mean())
print("Maximum Amount:",df["Amount"].max())
print("Minimum Amount:",df["Amount"].min())

df["Month"] = df["Transaction_Date"].dt.month_name()
print("Month Wise Transaction Count:")
print(df["Month"].value_counts())

print("Month-wise Total Amount:")
print(
    df.groupby("Month")["Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("Payment Mode-Wise Total Amount:")
print(
    df.groupby("Payment_Mode")["Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("Account Type_Wise Total Amount:")
print(
    df.groupby("Account_Type")["Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("Customer Segment-Wise Total Amount:")
print(
    df.groupby("Customer_Segment")["Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("Loan Status-Wise Total Amount:")
print(
    df.groupby("Loan_Status")["Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("Average Transaction Amount by Customer Segment:")
print(
    df.groupby("Customer_Segment")["Amount"]
    .mean()
    .sort_values(ascending=False)
)

print("Top 10 Customers by Total Transaction Amount:")
print(
    df.groupby("Customer_ID")["Amount"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

print("State-Wise Transaction Count:")
print(
   df["State"]
    .value_counts()
)

print("Payment Mode-Wise Transaction Count:")
print(
    df.groupby("Payment_Mode")["Amount"]
    .mean()
    .sort_values(ascending=False)
)

print("Account Type-Wise Average Transaction Amount:")
print(
    df.groupby("Account_Type")["Amount"]
    .mean()
    .sort_values(ascending=False)
)

print("Gender-Wise Total Transaction Amount:")
print(
    df.groupby("Gender")["Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("Gender-Wise  Average Transaction Amount:")
print(
    df.groupby("Gender")["Amount"]
    .mean()
    .sort_values(ascending=False)
)

print("Loan Status-Wise Average Transaction Amount:")
print(
    df.groupby("Loan_Status")["Amount"]
    .mean()
    .sort_values(ascending=False)
)

print("State-Wise Total Transaction Amount:")
print(
    df.groupby("State")["Amount"]
    .mean()
    .sort_values(ascending=False)
)

df["Age_Group"] = pd.cut(
    df["Customer_Age"],
    bins=[18, 25, 35, 45, 55, 65],
    labels=["18-25", "26-35", "36-45", "46-55", "56-65"]
)

print("Age Group-Wise Transaction Count:")
print(
    df["Age_Group"]
    .value_counts()
    .sort_index()
)

print("Age Group-Wise Total Transaction Amount:")
print(
    df.groupby("Age_Group", observed=True)["Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("Top 10 Branches By Total Transaction Amount:")
print(
    df.groupby("Branch")["Amount"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

print("Monthly Transaction Amount Trend:")
print(
    df.groupby("Month")["Amount"]
    .sum()
)

import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("data/bank_transactions.csv")
transaction_data = df.groupby("Transaction_Type")["Amount"].sum()
print(transaction_data)
transaction_data.plot(kind="bar")
plt.title("Transaction Type-Wise Total Amount")
plt.xlabel("Transaction Type")
plt.ylabel("Total Amount")
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig("images/transaction_type_amount.png")
plt.show()

df["Transaction_Date"] = pd.to_datetime(df["Transaction_Date"])
monthly_data = df.groupby(
    df["Transaction_Date"].dt.month
)["Amount"].sum()

monthly_data.index = [
    
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]

monthly_data.plot(kind="line", marker="o")
plt.title("Monthly Transaction Amount Trend")
plt.xlabel("Month")
plt.ylabel("Total Amount")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("images/monthly_transaction_trend.png")
plt.show()

payment_data = df["Payment_Mode"].value_counts()
payment_data.plot(kind="pie", autopct="%1.1f%%")
plt.title("Payment Mode Distribution")
plt.ylabel("")
plt.tight_layout()
plt.savefig("images/payment_mode_distribution.png")
plt.show()

plt.figure(figsize=(8, 5))
df["Amount"].plot(kind="hist", bins=20, edgecolor="black")
plt.title("Transaction Amount Distribution")
plt.xlabel("Transaction Amount")
plt.ylabel("Frequency")
plt.tight_layout()
plt.savefig("images/transaction_amount_distribution.png")
plt.show()

plt.figure(figsize=(8, 5))
plt.scatter(df["Amount"], df["Balance"], alpha=0.5)
plt.title("Transaction Amount vs Balance")
plt.xlabel("Transaction Amount")
plt.ylabel("Account_Balance")
plt.tight_layout()
plt.savefig("images/amount_vs_balance.png")
plt.show()