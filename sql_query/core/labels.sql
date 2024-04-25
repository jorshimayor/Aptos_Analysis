```Label Counts by Type```
SELECT label_type, COUNT(*) AS label_count
FROM aptos.core.dim_labels
GROUP BY label_type
ORDER BY label_count DESC;
```This query counts the number of labels for each label type, providing insight into the distribution of labels across different categories.```


```Top Label Creators```
SELECT creator, COUNT(*) AS label_count
FROM aptos.core.dim_labels
GROUP BY creator
ORDER BY label_count DESC;
```This query identifies the top label creators and their contribution to labeling addresses on the blockchain.```


```Most Common Label Subtypes```
SELECT label_subtype, COUNT(*) AS label_count
FROM aptos.core.dim_labels
GROUP BY label_subtype
ORDER BY label_count DESC
LIMIT 10;
```This query identifies the most common label subtypes, giving insight into the specific categories within each label type.```


```Labels by Blockchain```
SELECT blockchain, COUNT(*) AS label_count
FROM aptos.core.dim_labels
GROUP BY blockchain
ORDER BY label_count DESC;
```This query counts the number of labels for each blockchain, helping to understand the distribution of labeled addresses across different blockchains.```

```Label Frequency Analysis**:```
SELECT label, COUNT(*) AS label_frequency
FROM aptos.core.dim_labels
GROUP BY label
ORDER BY label_frequency DESC
LIMIT 10;
```This query analyzes the frequency of each label, identifying the most commonly labeled addresses in the blockchain ecosystem.```