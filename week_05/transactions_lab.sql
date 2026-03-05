-- Week 5 Lab: Transactions, Isolation, and Locking

-- Step 1 Baseline
select count(*) as members_count from public.members;
select count(*) as facilities_count from public.facilities;
select count(*) as bookings_count from public.bookings;

-- Step 2 Rollback Demo
BEGIN;

update public.members
set telephone = '1111111111'
where memid = 1;

select memid, telephone
from public.members
where memid = 1;

ROLLBACK;

select memid, telephone
from public.members
where memid = 1;

-- Step 2 Commit Demo
BEGIN;

update public.members
set telephone = '2222222222'
where memid = 1;

COMMIT;

select memid, telephone
from public.members
where memid = 1;

-- Step 3 Blocking Demo
BEGIN;

update public.members
set telephone = '3333333333'
where memid = 1;

-- Do not commit yet
-- Run update in another session to show blocking

-- Diagnostics
select * from pg_stat_activity;
