```Total NFT Sale Events Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS nft_sale_count
FROM aptos.nft.fact_nft_sales
GROUP BY day
ORDER BY day;
```This query counts the total number of NFT sale events per day, allowing you to visualize the trend of NFT sales over time.```


```Total Sales Volume Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       SUM(total_price_raw) AS total_sales_volume
FROM aptos.nft.fact_nft_sales
GROUP BY day
ORDER BY day;
```This query calculates the total sales volume of NFTs per day, providing insights into the monetary value of NFT transactions over time.```


```Top NFT Projects by Total Sales Volume```
SELECT project_name, SUM(total_price_raw) AS total_sales_volume
FROM aptos.nft.fact_nft_sales
GROUP BY project_name
ORDER BY total_sales_volume DESC
LIMIT 10;
```This query identifies the top NFT projects based on the total sales volume, helping you understand which projects are most popular among buyers.```


```Platform-wise NFT Sales Volume```
SELECT platform_name, SUM(total_price_raw) AS total_sales_volume
FROM aptos.nft.fact_nft_sales
GROUP BY platform_name
ORDER BY total_sales_volume DESC;
```This query calculates the total sales volume of NFTs on each platform, providing insights into the distribution of NFT sales among different platforms.```