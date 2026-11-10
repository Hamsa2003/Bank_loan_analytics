--loan summary view
CREATE OR REPLACE VIEW vw_loan_summary AS
SELECT
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount,
    ROUND(AVG(int_rate * 100), 2) AS average_interest_rate,
    ROUND(AVG(dti * 100), 2) AS average_dti
FROM financial_loan;

--loan status view
CREATE OR REPLACE VIEW vw_loan_status AS
SELECT
    loan_status,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS funded_amount,
    SUM(total_payment) AS amount_received
FROM financial_loan
GROUP BY loan_status;


--monthly trend view
CREATE OR REPLACE VIEW vw_monthly_trend AS
SELECT
    DATE_TRUNC('month', issue_date)::DATE AS issue_month,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_received
FROM financial_loan
GROUP BY DATE_TRUNC('month', issue_date)
ORDER BY issue_month;

SELECT * FROM vw_loan_summary;

SELECT * FROM vw_loan_status;

SELECT * FROM vw_monthly_trend;