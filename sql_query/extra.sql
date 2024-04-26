
```Total Transactions Over Time (Aptos Blockchain):```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS total_transactions
FROM aptos.core.fact_transactions
GROUP BY day
ORDER BY day;


```Total NFT Mints Over Time (Aptos Blockchain)```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
    COUNT(*) AS total_nft_mints
FROM aptos.nft.fact_nft_mints
GROUP BY day
ORDER BY day;


```Total Bridge Activity Over Time (Aptos Blockchain)```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS total_bridge_activity
FROM aptos.defi.fact_bridge_activity
GROUP BY day
ORDER BY day;


```Total Transactions Over Time (Interactions with Other Blockchains)```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS total_transactions
FROM aptos.core.fact_transactions
GROUP BY day
ORDER BY day;


```Top NFT Projects by Total Mints (Aptos Blockchain)```
SELECT project_name, SUM(nft_count) AS total_mints
FROM aptos.nft.fact_nft_mints
GROUP BY project_name
ORDER BY total_mints DESC
LIMIT 5;


```Top Tokens by Total Deposit and Withdraw Amounts (Aptos Blockchain)```
SELECT token_address,
       SUM(CASE WHEN transfer_event = 'DepositEvent' THEN amount ELSE 0 END) AS total_deposits,
       SUM(CASE WHEN transfer_event = 'WithdrawEvent' THEN amount ELSE 0 END) AS total_withdrawals
FROM aptos.core.fact_transfers
GROUP BY token_address
ORDER BY total_deposits DESC, total_withdrawals DESC
LIMIT 5;


```Average Platform Fee Percentage by Exchange (Aptos Blockchain)```
SELECT platform_name,
       AVG(platform_fee_raw / total_price_raw) * 100 AS avg_platform_fee_percentage
FROM aptos.nft.fact_nft_sales
GROUP BY platform_name;


```Total NFT Sales Volume Over Time (Aptos Blockchain)```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       SUM(total_price_raw) AS total_sales_volume
FROM aptos.nft.fact_nft_sales
GROUP BY day
ORDER BY day;


```Total NFT Sales Volume Over Time (Interactions with Other Blockchains)```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       SUM(total_price_raw) AS total_sales_volume
FROM aptos.nft.fact_nft_sales
GROUP BY day
ORDER BY day;


```Total Bridge Activity Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS total_bridge_activity
FROM aptos.defi.fact_bridge_activity
GROUP BY day
ORDER BY day;