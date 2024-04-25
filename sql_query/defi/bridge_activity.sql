```Total Bridge Activity Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS bridge_activity_count
FROM aptos.defi.fact_bridge_activity
GROUP BY day
ORDER BY day;
```This query counts the total number of bridge activities per day, allowing you to visualize the trend of bridge activity over time.```


```Bridge Activity by Protocol```
SELECT platform, COUNT(*) AS activity_count
FROM aptos.defi.fact_bridge_activity
GROUP BY platform
ORDER BY activity_count DESC;
```This query counts the number of bridge activities for each protocol, providing insights into the distribution of bridge usage among different protocols.```


```Total Amount Bridged Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       SUM(amount_unadj) AS total_bridged_amount
FROM aptos.defi.fact_bridge_activity
GROUP BY day
ORDER BY day;
```This query calculates the total amount of tokens bridged per day, helping you understand the movement of assets across chains over time.```


```Top Senders and Receivers by Bridged Amount```
SELECT sender, SUM(amount_unadj) AS total_sent_amount
FROM aptos.defi.fact_bridge_activity
GROUP BY sender
ORDER BY total_sent_amount DESC
LIMIT 10;

SELECT receiver, SUM(amount_unadj) AS total_received_amount
FROM aptos.defi.fact_bridge_activity
GROUP BY receiver
ORDER BY total_received_amount DESC
LIMIT 10;
```These queries identify the top senders and receivers based on the total amount of tokens they have sent and received through the bridge, providing insights into the most active participants in cross-chain transactions.```


```Bridge Activity Between Specific Chains```
SELECT source_chain_name, destination_chain_name, COUNT(*) AS activity_count
FROM aptos.defi.fact_bridge_activity
GROUP BY source_chain_name, destination_chain_name
ORDER BY activity_count DESC;
```This query counts the number of bridge activities between specific source and destination chains, helping you understand the most common bridge routes.```