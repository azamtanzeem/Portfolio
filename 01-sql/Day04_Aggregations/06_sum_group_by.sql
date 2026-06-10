-- ============================================================
-- DataLemur | Difficulty: Easy
-- Topic: SUM, CASE WHEN, GROUP BY
-- Platform: PayPal
-- Question: Retrieve the final account balance for each account.
--           Deposits add to balance, withdrawals subtract.
-- ============================================================

SELECT
    account_id,
    SUM(
        CASE
            WHEN transaction_type = 'Deposit' THEN amount   -- add deposits
            ELSE -amount                                     -- subtract withdrawals
        END
    ) AS final_balance
FROM transactions
GROUP BY account_id;

-- ============================================================
-- KEY CONCEPTS USED:
--   SUM + CASE WHEN  → conditional aggregation — one of the most
--                      common real-world SQL patterns
--                      lets you sum only certain rows within a group
--   ELSE -amount     → negates the value for withdrawals so SUM
--                      naturally subtracts them
--   GROUP BY         → produces one balance row per account
--
-- ALTERNATIVE with two CTEs (more explicit):
--   WITH deposits AS (SELECT account_id, SUM(amount) AS d FROM transactions
--                     WHERE transaction_type = 'Deposit' GROUP BY account_id),
--        withdrawals AS (SELECT account_id, SUM(amount) AS w FROM transactions
--                        WHERE transaction_type = 'Withdrawal' GROUP BY account_id)
--   SELECT d.account_id, (d.d - w.w) AS final_balance
--   FROM deposits d JOIN withdrawals w USING (account_id);
-- ============================================================
