-- most recent login of either password or access_key
select u.account_id, u.name, u.password_last_used, k.access_key_last_used_date, GREATEST(u.password_last_used, k.access_key_last_used_date) as most_recent_login
from 
	lxk.aws_iam_user u
		left join lxk.aws_iam_access_key k
		on u.name=k.user_name AND u.account_id=k.account_id

-- users' group memberships
select
  name as user_name,
  iam_group ->> 'GroupName' as group_name,
  iam_group ->> 'GroupId' as group_id,
  iam_group ->> 'CreateDate' as create_date
from
  lxk.aws_iam_user
  cross join jsonb_array_elements(groups) as iam_group;
