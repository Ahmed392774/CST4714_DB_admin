Week 5 Lab Analysis

Rollback proved that database changes can be undone if the transaction is not committed.

Commit proved that once a transaction is committed, the changes are saved permanently in the database.

Blocking happened when two sessions tried to update the same row at the same time.

The second session had to wait until the first transaction finished.

To diagnose the blocking issue I used the query:
select * from pg_stat_activity;

One prevention habit is to keep transactions short so locks are released quickly.
