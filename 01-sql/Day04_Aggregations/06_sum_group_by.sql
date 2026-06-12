
DataLemur | Difficulty: Easy
Topic: SUM, CASE WHEN, GROUP BY
Platform: PayPal
Question: Retrieve the final account balance for each account.
Deposits add to balance, withdrawals subtract.


SELECT
    account_id,
    SUM(
        CASE
            WHEN transaction_type = 'Deposit' THEN amount   
            ELSE -amount                                     
        END
    ) AS final_balance
FROM transactions
GROUP BY account_id;


KEY CONCEPTS USED:
SUM + CASE WHEN  → conditional aggregation — one of the most
common real-world SQL patterns
lets you sum only certain rows within a group
ELSE -amount     → negates the value for withdrawals so SUM
naturally subtracts them
GROUP BY         → produces one balance row per account


