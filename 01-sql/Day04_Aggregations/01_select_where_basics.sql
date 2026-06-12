
DataLemur | Difficulty: Easy
Topic: SELECT, WHERE, GROUP BY, COUNT
Platform: Twitter / X
Question: Obtain a histogram of tweets posted per user in 2022.
Output tweet count per user as the bucket and the
number of users who fall into that bucket.


SELECT
    tweet_count_per_user,
    COUNT(user_id) AS number_of_users
FROM (
    SELECT
        user_id,
        COUNT(tweet_id) AS tweet_count_per_user
    FROM tweets
    WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY user_id
) AS total_tweets
GROUP BY tweet_count_per_user;


KEY CONCEPTS USED:
WHERE with BETWEEN  → inclusive date range filter
COUNT(tweet_id)     → counts non-NULL tweet IDs per user
GROUP BY user_id    → one row per user
Outer GROUP BY      → groups users by their tweet count
to build the histogram buckets

