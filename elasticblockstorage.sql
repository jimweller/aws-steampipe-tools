-- find orphan snapshots, snapshots where the original
-- volume no longer exists.
select vol.volume_id, snap.volume_id, snap.snapshot_id, snap.start_time, snap.volume_size
from
lxkprod.aws_ebs_volume as vol
right join 
lxkprod.aws_ebs_snapshot as snap
on
vol.volume_id=snap.volume_id
where vol.volume_id is null


-- all calsaw production vms and their EBS storage
select
  i.title,
  volume_id,
  volume_type,
  size,
  att ->> 'InstanceId' as ec2_instance_id
from
  f_348632094786.aws_ebs_volume
  cross join jsonb_array_elements(attachments) as att
  join f_348632094786.aws_ec2_instance as i on i.instance_id = att ->> 'InstanceId'
 where
 	i.title like 'pdx-c1011%'




-- all calsaw production vms and their EBS storage
select
  i.title,
  volume_id,
  volume_type,
  size,
  att ->> 'InstanceId' as ec2_instance_id
from
  f_348632094786.aws_ebs_volume
  cross join jsonb_array_elements(attachments) as att
  join f_348632094786.aws_ec2_instance as i on i.instance_id = att ->> 'InstanceId'
 where
 	i.title like 'pdx-c1011%'
