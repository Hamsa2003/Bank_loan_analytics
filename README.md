# 🏦 Bank Loan Analytics | Python • PostgreSQL • Power BI

## 📌 Project Overview

**Bank Loan Analytics** is an end-to-end data analytics and business intelligence project developed to analyze financial loan data, evaluate loan portfolio performance, understand borrower characteristics, and identify potential credit risk patterns.

The project follows a complete data analytics workflow using **Python, PostgreSQL, and Microsoft Power BI**.

- **Python** is used for data exploration, cleaning, preprocessing, and analysis.
- **PostgreSQL** is used for structured data storage, SQL-based analysis, aggregations, and creating analytical views.
- **Power BI** is used to develop interactive dashboards, visualize KPIs, and communicate meaningful business insights.

The objective is to transform raw financial loan data into actionable insights that support better understanding of lending performance, repayment behaviour, and credit risk.

## 🎯 Project Objectives

- Analyze overall loan application performance.
- Evaluate total funded loan amounts and total amounts received.
- Compare Good Loans and Bad Loans.
- Understand loan repayment status and portfolio quality.
- Analyze borrower profiles based on income, employment length, and home ownership.
- Examine loan distribution across states, grades, and purposes.
- Identify patterns in interest rates and Debt-to-Income (DTI) ratios.
- Build interactive dashboards for data-driven financial analysis.

## 🛠️ Tech Stack

| Technology | Application |
|---|---|
| Python | Data cleaning, preprocessing, EDA, and analysis |
| Pandas | Data manipulation and transformation |
| NumPy | Numerical operations |
| Matplotlib / Seaborn | Exploratory data visualizations |
| PostgreSQL | Relational database management |
| SQL | Data querying, aggregation, and analysis |
| SQL Views | Reusable analytical datasets |
| Microsoft Power BI | Interactive dashboard development |
| Power Query | Data transformation |
| DAX | KPI calculations and analytical measures |
| GitHub | Version control and project documentation |

## 📂 Project Structure

```text
Bank_loan_analytics/
│
├── Bank_loan_analysis_Python.pdf
│
├── Bank_loan_queries.sql
│
├── views.sql
│
├── Financial_loan_dataset.csv
│
├── cleaned_financial_loan_data.csv
│
├── financial_loan_postgres.csv
│
├── bank_loan_analysis.pbix
│
├── Bank_Loan_Analytics_Project_Report.pdf
│
└── README.md
```

## 📊 Dataset Overview

The project uses a financial loan dataset containing information about loan applications, borrowers, repayment status, and financial attributes.

The cleaned dataset contains **38,576 records and 29 columns**.

### Important Dataset Columns

| Column | Description |
|---|---|
| ID | Unique loan application identifier |
| LOAN_AMOUNT | Funded loan amount |
| TOTAL_PAYMENT | Total amount received |
| LOAN_STATUS | Loan repayment status |
| GRADE | Loan grade |
| SUB_GRADE | Loan sub-grade |
| INT_RATE | Interest rate |
| DTI | Debt-to-Income ratio |
| ANNUAL_INCOME | Borrower's annual income |
| PURPOSE | Purpose of the loan |
| HOME_OWNERSHIP | Borrower's home ownership |
| EMP_LENGTH | Employment length |
| ADDRESS_STATE | Borrower's state |
| VERIFICATION_STATUS | Income verification status |
| ISSUE_DATE | Loan issue date |

## 🔄 Project Workflow

The project follows a structured end-to-end analytics pipeline.

```text
Raw Financial Loan Dataset
           |
           ▼
     Python Analysis
           |
           ▼
 Data Cleaning & Preprocessing
           |
           ▼
   Cleaned CSV Dataset
           |
           ▼
      PostgreSQL
           |
           ▼
 SQL Queries & Analytical Views
           |
           ▼
     Microsoft Power BI
           |
           ▼
 Interactive Dashboards & Insights
```

## 🐍 1. Python – Data Cleaning & Exploratory Data Analysis

Python was used as the initial stage of the analytics workflow to understand and prepare the financial loan dataset.

### Activities Performed

- Imported the raw CSV dataset using Pandas.
- Inspected dataset dimensions, column names, and data types.
- Performed exploratory data analysis.
- Checked for missing values and duplicate records.
- Cleaned and standardized data.
- Handled date and numerical columns.
- Prepared the cleaned dataset for database analysis and visualization.
- Explored loan distribution, repayment status, and financial characteristics.

### Python Libraries

- Pandas
- NumPy
- Matplotlib
- Seaborn

**Output:** A cleaned financial loan dataset ready for further analysis.

## 🐘 2. PostgreSQL – Database Management & SQL Analysis

PostgreSQL was used to store and analyze the prepared financial loan data.

The cleaned dataset was imported into a PostgreSQL database, where SQL queries were written to perform structured financial and business analysis.

### Database Activities

- Created the financial loan table.
- Defined appropriate data types for loan attributes.
- Imported financial loan records.
- Executed SQL queries for financial analysis.
- Used aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`.
- Applied `GROUP BY`, `ORDER BY`, `CASE`, and filtering conditions.
- Created analytical SQL views for reusable analysis.

### SQL Analysis Performed

1. Total loan applications.
2. Total funded amount.
3. Total amount received.
4. Average loan amount.
5. Loan status analysis.
6. Good Loan vs Bad Loan analysis.
7. Loan applications by purpose.
8. Loan grade and interest rate analysis.
9. State-wise loan analysis.
10. Home ownership analysis.
11. Monthly loan application trends.
12. High-risk and charged-off loan analysis.
13. Borrowers with high DTI.
14. Employment length analysis.
15. Verification status analysis.

**Output:** Structured loan data, SQL analysis results, and reusable analytical views.

## 📈 3. Power BI – Interactive Dashboard Development

Microsoft Power BI was used to transform the prepared financial data into interactive dashboards.

The report includes KPI cards, charts, slicers, filters, and DAX measures to analyze loan portfolio performance from multiple perspectives.

### Key Performance Indicators (KPIs)

- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Average Loan Amount
- Average Interest Rate
- Average DTI
- Good Loan Applications
- Bad Loan Applications
- Good Loan Percentage
- Bad Loan Percentage
- Good Loan Funded Amount
- Bad Loan Funded Amount

### Dashboard Pages

**1. Executive Summary**

Provides a consolidated overview of the loan portfolio, including application trends, funded amounts, loan status, grades, and loan purposes.

**2. Loan Quality Analysis**

Examines Good Loans and Bad Loans, their distribution, funded amounts, repayment status, and risk patterns.

**3. Borrower Profile Analysis**

Analyzes borrower characteristics such as annual income, employment length, home ownership, loan purpose, and verification status.

**4. Geographical Analysis**

Explores state-wise loan applications, funded amounts, amount received, and loan category distribution.

**5. Financial & Risk Analysis**

Evaluates financial indicators, including average interest rates, DTI ratios, loan grades, and repayment-related risk patterns.

**6. Key Findings**

Highlights important analytical observations and summarizes the major insights obtained from the project.

**7. Conclusion & Key Takeaways**

Presents the overall project outcomes, important findings, and potential future improvements.

### Interactive Features

- Dynamic KPI cards
- Interactive charts and graphs
- Slicers and filters
- Date-based analysis
- State-wise filtering
- Loan grade and purpose filtering
- Good Loan and Bad Loan comparisons
- Synchronized slicers across relevant report pages

## 📌 Key Findings

Based on the cleaned financial loan dataset:

| Metric | Result |
|---|---:|
| Total Loan Applications | 38,576 |
| Good Loan Applications | 33,243 |
| Bad Loan Applications | 5,333 |
| Good Loan Percentage | 86.18% |
| Bad Loan Percentage | 13.82% |
| Total Funded Amount | Approximately $436M |
| Total Amount Received | Approximately $473M |
| Fully Paid Loans | 32,145 |
| Charged Off Loans | 5,333 |
| Current Loans | 1,098 |

### Business Insights

- Good Loans account for approximately 86.18% of total loan applications.
- Bad Loans represent approximately 13.82% of the portfolio.
- The total funded amount is approximately $436 million.
- The total amount received is approximately $473 million.
- Loan grades show variations in interest rates and borrower DTI levels.
- Borrower income, employment length, home ownership, and verification status help explain lending patterns.
- Geographical analysis enables comparisons of lending activity across states.

## 🚀 How to Run the Project

### Step 1: Clone the Repository

```bash
git clone https://github.com/Hamsa2003/Bank_loan_analytics.git
```

Navigate to the project directory:

```bash
cd Bank_loan_analytics
```

### Step 2: Python Setup

Install Python and the required libraries:

```bash
pip install pandas numpy matplotlib seaborn
```

Use the Python analysis documentation included in the repository to understand the data preparation and analysis workflow.

### Step 3: PostgreSQL Setup

1. Install PostgreSQL and open pgAdmin or your preferred SQL client.
2. Create a database for the project, for example:

```sql
CREATE DATABASE bank_loan_db;
```

3. Open `Bank_loan_queries.sql`.
4. Execute the table creation and analysis queries in the appropriate order.
5. Import the cleaned financial loan dataset into the database table.
6. Execute `views.sql` to create the analytical views.

Update table or database names if your local setup uses different names.

### Step 4: Power BI Setup

1. Install Microsoft Power BI Desktop.
2. Open `bank_loan_analysis.pbix`.
3. If required, update the dataset source path.
4. Configure the database connection if the report uses PostgreSQL as its source.
5. Refresh the data.
6. Explore all dashboard pages using the interactive slicers and filters.

## 🔮 Future Enhancements

- Develop machine learning models for loan default prediction.
- Implement borrower credit risk scoring.
- Perform predictive analysis of repayment behaviour.
- Integrate automated database refresh.
- Introduce advanced borrower segmentation.
- Build real-time financial risk monitoring dashboards.
- Extend the analysis with additional financial and economic indicators.

## 🎓 Learning Outcomes

This project provided practical experience in:

- End-to-end data analytics workflows.
- Data cleaning and preprocessing using Python.
- Exploratory Data Analysis (EDA).
- Relational database design and management using PostgreSQL.
- Writing SQL queries for business analysis.
- Creating reusable analytical SQL views.
- Developing DAX measures and KPIs.
- Building interactive Power BI dashboards.
- Translating financial data into meaningful business insights.

## 📝 Conclusion

The Bank Loan Analytics project demonstrates the practical application of Python, PostgreSQL, and Power BI in an end-to-end data analytics workflow. By combining data preparation, database querying, financial analysis, and interactive visualization, the project provides a comprehensive understanding of loan portfolio performance, borrower characteristics, repayment behaviour, and potential credit risk.

It highlights how multiple data technologies can work together to transform raw financial records into meaningful insights and support data-driven decision-making.

## 👩‍💻 Author

**Hamsaveni P**

Aspiring Data Analyst | Power BI Developer

**Technical Skills:** Python | SQL | PostgreSQL | Power BI | Excel | Data Analytics | Data Visualization

- **GitHub:** [Hamsa2003](https://github.com/Hamsa2003)
- **Project Repository:** [Bank Loan Analytics](https://github.com/Hamsa2003/Bank_loan_analytics)

---

⭐ If you find this project useful, feel free to explore the repository and give it a star!

**Project Domain:** Data Analytics | Financial Analytics | Business Intelligence

**Technologies:** Python | PostgreSQL | SQL | Power BI | Data Visualization |
