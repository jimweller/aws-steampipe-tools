-- Sometimes it is useful to "copy" tables into the "memory", especially for slow
-- API endpoints or very large sets. Then you can explore relations much faster.
-- This collection of queries builds two tables in memory and then does a
-- right outer join using the local copies.

-- you can also add temp to not persist the table between restarts

-- https://www.postgresql.org/docs/current/sql-selectinto.html

select vol.*
into lvol
from
lxk_prod.aws_ebs_volume as vol



select snap.volume_id, snap.snapshot_id, snap.start_time, snap.volume_size,snap.tags
into lsnap
from
lxk_prod.aws_ebs_snapshot as snap



select vol.volume_id, snap.volume_id, snap.snapshot_id, snap.start_time, snap.volume_size, snap.tags
from
lvol as vol
right join 
lsnap as snap
on
vol.volume_id=snap.volume_id
where vol.volume_id is null
