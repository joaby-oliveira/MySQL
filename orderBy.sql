/* Ordering by column name */
select * from v_users
order by id

/* Ordering by column number */
select * from v_users
order by 1

/* Ordering by different columns */
select * from v_users
order by type, name

/* Ordering by in asc */
select * from v_users
order by name asc

/* Ordering by in desc */
select * from v_users
order by name desc