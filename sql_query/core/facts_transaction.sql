```Transaction Volume Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS transaction_count
FROM aptos.core.fact_transactions
GROUP BY day
ORDER BY day;


```Transaction Success Rate Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       SUM(CASE WHEN success THEN 1 ELSE 0 END) AS successful_transactions,
       SUM(CASE WHEN NOT success THEN 1 ELSE 0 END) AS failed_transactions
FROM aptos.core.fact_transactions
GROUP BY day
ORDER BY day;


```Average Gas Used per Transaction```
SELECT AVG(gas_used) AS avg_gas_used
FROM aptos.core.fact_transactions;


```Top Senders by Transaction Count```
SELECT sender, COUNT(*) AS transaction_count
FROM aptos.core.fact_transactions
GROUP BY sender
ORDER BY transaction_count DESC
LIMIT 10;