
-- See here for shorthand syntax https://steampipe.io/docs/sql/querying-json
SELECT 
	account_id, 'lxk_prod' as account, title,instance_id,instance_type, cpu_options_core_count, vpc_id,
	tags['Customer'] as customer
	FROM lxk_prod.aws_ec2_instance --  production (lxkcloud) 065131256760

-- Extract json attributes from a json column
select
  name as user_name,
  iam_group ->> 'GroupName' as group_name,
  iam_group ->> 'GroupId' as group_id,
  iam_group ->> 'CreateDate' as create_date
from
  lxk.aws_iam_user
  cross join jsonb_array_elements(groups) as iam_group;