# Bank Data Analysis Project

## Project Overview
This project analyzes banking transactions to understand transaction patterns, customer behavior, payment methods, and state-wise transaction amounts using Python, Pandas, Matplotlib, SQL, and Power BI.

## Tools & Technologies
- Python
- Pandas
- Matplotlib
- SQL
- Power BI
- Git & GitHub

## Dataset
The dataset contains 1,000 banking transaction records with 15 columns, including:
- Transaction ID
- Customer ID
- Transaction Date
- Account Type
- Transaction Type
- Amount
- Balance
- Branch
- City and State
- Payment Mode
- Customer Age
- Gender
- Customer Segment
- Loan Status

## Project Work
- Loaded and analyzed banking transaction data using Pandas.
- Checked missing values and duplicate records.
- Analyzed transaction amounts and transaction types.
- Compared transaction activity across states and payment modes.
- Created five data visualizations using Matplotlib.
- Built a Power BI dashboard with KPI cards, charts, and interactive slicers.

## Key Findings
- Total transaction amount: 73,425,351.84
- Total transactions: 1,000
- Average transaction amount: 73,425.35
- Deposit, Transfer, and Withdrawal transactions were compared.
- Monthly trends and state-wise transaction amounts were analyzed.

## Project Structure
```text
Bank-Data-Analysis/
├── data/
│   └── bank_transactions.csv
├── images/
│   ├── amount_vs_balance.png
│   ├── monthly_transaction_trend.png
│   ├── payment_mode_distribution.png
│   ├── transaction_amount_distribution.png
│   └── transaction_type_amount.png
├── python/
│   └── data_analysis.py
├── sql/
│   └── bank_analysis_queries.sql
├── Bank_Data_Analysis.pbix
├── basic.py
└── README.md
```

## How to Run
1. Clone or download this repository.
2. Install the required Python libraries:
   `pip install pandas matplotlib`
3. Run the analysis script:
   `python python/data_analysis.py`

## Dashboard
The Power BI dashboard summarizes transaction amounts, transaction counts, average transaction amount, monthly trends, payment modes, and state-wise performance.

## Disclaimer
This project uses a practice dataset for learning and portfolio demonstration purposes.

## Author
Data Analysis Portfolio Project