
-- get a list of vpc logs in all accounts (which are really just stubs for cloudwatch logs)
-- and their retention. This can take awhile to run depending on how many
-- cloud watch logs there are to join against (20k+ as of 2024-03)
select 
v.account_id, v.region, v.log_group_name, v.log_destination_type, v.log_destination, c.retention_in_days
from 
fnd.aws_vpc_flow_log v
join fnd.aws_cloudwatch_log_group c on v.log_group_name = c.name


-- find a specific cloudwatch log
select * from fnd.aws_cloudwatch_log_group where name='/aws/vpc-flow-log/vpc-03bcb7dbd348f660c' limit 100