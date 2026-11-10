DROP TABLE IF EXISTS financial_loan CASCADE;

CREATE TABLE financial_loan (
    id BIGINT PRIMARY KEY,
    address_state VARCHAR(10),
    emp_length VARCHAR(50),
    emp_title VARCHAR(255),
    grade VARCHAR(10),
    home_ownership VARCHAR(50),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_amount NUMERIC(15,2),
    loan_status VARCHAR(50),
    purpose VARCHAR(100),
    sub_grade VARCHAR(10),
    term VARCHAR(50),
    verification_status VARCHAR(100),
    annual_income NUMERIC(15,2),
    dti NUMERIC(12,4),
    installment NUMERIC(15,2),
    int_rate NUMERIC(12,6),
    total_acc INTEGER,
    total_payment NUMERIC(15,2),
    next_payment_date DATE
);

SELECT *
FROM financial_loan
LIMIT 10;

--Total loan applications
SELECT COUNT(*) AS total_loan_applications
FROM financial_loan;

--Total funded amount
SELECT SUM(loan_amount) AS total_funded_amount
FROM financial_loan;

--Total amount received
SELECT SUM(total_payment) AS total_amount_received
FROM financial_loan;

--Average loan amount
SELECT ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM financial_loan;

--Loan status analysis
SELECT
    loan_status,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS funded_amount,
    SUM(total_payment) AS amount_received
FROM financial_loan
GROUP BY loan_status
ORDER BY total_applications DESC;

--Good loans vs bad loans
SELECT
    CASE
        WHEN LOWER(loan_status) IN ('fully paid', 'current')
            THEN 'Good Loan'
        WHEN LOWER(loan_status) = 'charged off'
            THEN 'Bad Loan'
        ELSE 'Other / Review'
    END AS loan_category,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_received
FROM financial_loan
GROUP BY loan_category
ORDER BY total_applications DESC;

--Loan applications by purpose
SELECT
    purpose,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM financial_loan
GROUP BY purpose
ORDER BY total_applications DESC;

--Loan grade analysis
SELECT
    grade,
    COUNT(*) AS total_applications,
    ROUND(AVG(int_rate * 100), 2) AS average_interest_rate,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY grade
ORDER BY grade;

--State-wise loan analysis
SELECT
    address_state,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_received
FROM financial_loan
GROUP BY address_state
ORDER BY total_funded_amount DESC;

--Home ownership analysis
SELECT
    home_ownership,
    COUNT(*) AS total_applications,
    ROUND(AVG(annual_income), 2) AS average_income,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY home_ownership
ORDER BY total_applications DESC;

--Monthly loan application trend
SELECT
    EXTRACT(YEAR FROM issue_date) AS issue_year,
    EXTRACT(MONTH FROM issue_date) AS issue_month,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY
    EXTRACT(YEAR FROM issue_date),
    EXTRACT(MONTH FROM issue_date)
ORDER BY issue_year, issue_month;

--Identify high-risk loans
SELECT
    grade,
    loan_status,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount
FROM financial_loan
WHERE LOWER(loan_status) = 'charged off'
GROUP BY grade, loan_status
ORDER BY total_loans DESC;

--Borrowers with high DTI
SELECT
    id,
    annual_income,
    dti,
    loan_amount,
    loan_status
FROM financial_loan
WHERE dti > 0.40
ORDER BY dti DESC;

--Loan amount by employment length
SELECT
    emp_length,
    COUNT(*) AS total_applications,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount,
    SUM(total_payment) AS total_received
FROM financial_loan
GROUP BY emp_length
ORDER BY total_applications DESC;

--Verification status analysis
SELECT
    verification_status,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS funded_amount,
    ROUND(AVG(annual_income), 2) AS average_income
FROM financial_loan
GROUP BY verification_status
ORDER BY total_applications DESC;

--Loan status by loan grade
SELECT
    grade,
    loan_status,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_funded_amount,
    ROUND(AVG(int_rate * 100), 2) AS avg_interest_rate
FROM financial_loan
GROUP BY grade, loan_status
ORDER BY grade, total_loans DESC;

--Loan term analysis
SELECT
    term,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_received,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM financial_loan
GROUP BY term
ORDER BY total_applications DESC;

--Interest rate analysis by loan status
SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(AVG(int_rate * 100), 2) AS average_interest_rate,
    ROUND(AVG(dti * 100), 2) AS average_dti,
    ROUND(AVG(annual_income), 2) AS average_income
FROM financial_loan
GROUP BY loan_status
ORDER BY total_loans DESC;

--Annual income group analysis
SELECT
    CASE
        WHEN annual_income < 30000 THEN 'Low Income'
        WHEN annual_income < 60000 THEN 'Lower Middle Income'
        WHEN annual_income < 100000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_category,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_received,
    ROUND(AVG(dti * 100), 2) AS average_dti
FROM financial_loan
WHERE annual_income > 0
GROUP BY income_category
ORDER BY total_applications DESC;

--Loan purpose and loan status
SELECT
    purpose,
    COUNT(*) AS total_applications,
    SUM(CASE
        WHEN LOWER(loan_status) = 'charged off'
        THEN 1 ELSE 0
    END) AS charged_off_loans,
    ROUND(
        100.0 * SUM(CASE
            WHEN LOWER(loan_status) = 'charged off'
            THEN 1 ELSE 0
        END) / NULLIF(COUNT(*), 0), 2
    ) AS charged_off_percentage,
    SUM(loan_amount) AS total_funded_amount
FROM financial_loan
GROUP BY purpose
ORDER BY charged_off_percentage DESC;

--State-wise loan performance
SELECT
    address_state,
    COUNT(*) AS total_applications,
    SUM(CASE
        WHEN LOWER(loan_status) = 'fully paid'
        THEN 1 ELSE 0
    END) AS fully_paid_loans,
    SUM(CASE
        WHEN LOWER(loan_status) = 'charged off'
        THEN 1 ELSE 0
    END) AS charged_off_loans,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount,
    SUM(total_payment) AS total_received
FROM financial_loan
GROUP BY address_state
ORDER BY total_applications DESC;

--Data quality validation
-- Total records
SELECT COUNT(*) AS total_records
FROM financial_loan;

-- Duplicate IDs
SELECT id, COUNT(*)
FROM financial_loan
GROUP BY id
HAVING COUNT(*) > 1;

-- Missing values
SELECT
    COUNT(*) FILTER (WHERE loan_amount IS NULL) AS missing_loan_amount,
    COUNT(*) FILTER (WHERE annual_income IS NULL) AS missing_income,
    COUNT(*) FILTER (WHERE loan_status IS NULL) AS missing_loan_status,
    COUNT(*) FILTER (WHERE issue_date IS NULL) AS missing_issue_date
FROM financial_loan;

-- Check loan status categories
SELECT DISTINCT loan_status
FROM financial_loan;

