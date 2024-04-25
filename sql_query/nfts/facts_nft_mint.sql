```Total NFT Mints Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       COUNT(*) AS nft_mint_count
FROM aptos.nft.fact_nft_mints
GROUP BY day
ORDER BY day;
```This query counts the total number of NFT mint events per day, allowing you to visualize the trend of NFT minting activity over time.```

```Total NFTs Minted Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       SUM(nft_count) AS total_nfts_minted
FROM aptos.nft.fact_nft_mints
GROUP BY day
ORDER BY day;
```This query calculates the total number of NFTs minted per day, providing insights into the overall volume of newly minted NFTs over time.```

```Top NFT Projects by Total Mints```
SELECT project_name, SUM(nft_count) AS total_mints
FROM aptos.nft.fact_nft_mints
GROUP BY project_name
ORDER BY total_mints DESC
LIMIT 10;
```This query identifies the top NFT projects based on the total number of NFTs minted, helping you understand which projects are most active in minting new NFTs.```

```Average NFTs Minted per Event```
SELECT AVG(nft_count) AS avg_nfts_minted_per_event
FROM aptos.nft.fact_nft_mints;
```This query calculates the average number of NFTs minted per mint event, providing insights into the typical size of NFT minting operations.```

```Total NFT Minting Volume Over Time```
SELECT DATE_TRUNC('day', block_timestamp) AS day,
       SUM(total_price_raw) AS total_minting_volume
FROM aptos.nft.fact_nft_mints
GROUP BY day
ORDER BY day;
```This query calculates the total minting volume (in the currency of the transaction) per day, helping you understand the monetary value associated with NFT minting activity over time.```