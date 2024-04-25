```Total Deposit and Withdraw Events Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
    SUM(CASE WHEN transfer_event = 'DepositEvent' THEN 1 ELSE 0 END) AS deposit_count,
    SUM(CASE WHEN transfer_event = 'WithdrawEvent' THEN 1 ELSE 0 END) AS withdraw_count
FROM aptos.core.fact_transfers
GROUP BY day
ORDER BY day;
```This query counts the number of deposit and withdraw events per day, allowing you to visualize the trend of deposit and withdraw activity over time.```


```Total Deposit and Withdraw Amounts Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
    SUM(CASE WHEN transfer_event = 'DepositEvent' THEN amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN transfer_event = 'WithdrawEvent' THEN amount ELSE 0 END) AS total_withdrawals
FROM aptos.core.fact_transfers
GROUP BY day
ORDER BY day;
```This query calculates the total amount deposited and withdrawn per day, providing insights into the movement of funds on the blockchain over time.```


```Top Accounts by Total Deposit Amount```
SELECT account_address, SUM(amount) AS total_deposit_amount
FROM aptos.core.fact_transfers
WHERE transfer_event = 'DepositEvent'
GROUP BY account_address
ORDER BY total_deposit_amount DESC
LIMIT 10;
```This query identifies the top accounts based on the total amount deposited, helping you understand which accounts are the largest contributors to deposits.```


```Top Tokens by Total Deposit and Withdraw Amounts```
SELECT token_address,
       SUM(CASE WHEN transfer_event = 'DepositEvent' THEN amount ELSE 0 END) AS total_deposit_amount,
       SUM(CASE WHEN transfer_event = 'WithdrawEvent' THEN amount ELSE 0 END) AS total_withdrawal_amount
FROM aptos.core.fact_transfers
GROUP BY token_address
ORDER BY total_deposit_amount DESC, total_withdrawal_amount DESC
LIMIT 10;
```This query identifies the top tokens based on the total amount deposited and withdrawn, providing insights into the most active tokens on the blockchain.```

