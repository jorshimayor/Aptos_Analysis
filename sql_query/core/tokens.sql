```Token Creation Count Over Time```
```This query counts the number of token creation transactions per day, allowing you to visualize the trend of token creation activity over time.```
SELECT DATE_TRUNC('day', transaction_created_timestamp) AS day,
    COUNT(*) AS token_creation_count
FROM aptos.core.dim_tokens
GROUP BY day
ORDER BY day;


```Top Token Creators```
```This query identifies the top token creators based on the number of tokens they've created, providing insights into the most active participants in token creation.```
SELECT creator_address, COUNT(*) AS token_creation_count
FROM aptos.core.dim_tokens
GROUP BY creator_address
ORDER BY token_creation_count DESC
LIMIT 10;


```Token Distribution by Decimals```
```This query groups tokens by their number of decimals and counts the number of tokens with each decimal value, helping you understand the distribution of token decimals in the blockchain ecosystem.```
SELECT decimals, COUNT(*) AS token_count
FROM aptos.core.dim_tokens
GROUP BY decimals
ORDER BY decimals;


```Token Creation by Symbol```
```This query identifies the most frequently created token symbols, enabling you to understand the popularity of different token types in the blockchain.```
SELECT symbol, COUNT(*) AS token_creation_count
FROM aptos.core.dim_tokens
GROUP BY symbol
ORDER BY token_creation_count DESC
LIMIT 10;


```Average Token Creation Rate```
```This query calculates the average number of token creation transactions per day, providing insights into the overall rate of token creation activity in the blockchain ecosystem.```
SELECT AVG(token_creation_count) AS avg_token_creation_rate
FROM (
    SELECT DATE_TRUNC('day', transaction_created_timestamp) AS day,
        COUNT(*) AS token_creation_count
    FROM aptos.core.dim_tokens
    GROUP BY day
) subquery;