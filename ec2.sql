-- get ec2 information from a subset of accounts using UNION
-- also note the use of array notation for json attributes
SELECT 
	account_id, 'lxk_prod' as account, title,instance_id,instance_type, cpu_options_core_count, vpc_id,
	tags['Customer'] as customer
	FROM lxk_prod.aws_ec2_instance -- lexmark production (lxkcloud) 065131256760
union
SELECT 
	account_id, 'arsl_prod' as account, title,instance_id,instance_type, cpu_options_core_count, vpc_id,
	tags['Customer'] as customer
	FROM f_129068742800.aws_ec2_instance -- arsl web/app 129068742800
union
SELECT 
	account_id, 'asrl_shared' as account, title,instance_id,instance_type, cpu_options_core_count, vpc_id,
	tags['Customer'] as customer
	FROM f_376794214343.aws_ec2_instance; -- arsl databases in shared account 376794214343




-- get volumes and which ec2 instances they are attached to
select
  volume_id,
  volume_type,
  size,
  att ->> 'InstanceId' as ec2_instance_id
from
  lxk_prod.aws_ebs_volume
  cross join jsonb_array_elements(attachments) as att
  join lxk_prod.aws_ec2_instance as i on i.instance_id = att ->> 'InstanceId'