--  find count for single account. 
SELECT count(*) from "f_348632094786"."aws_ec2_instance";

-- find count for all accounts using aggregator
SELECT count(*) from "fnd"."aws_ec2_instance";

-- list out all accounts and their count
Select "account_id", count(*) from "fnd"."aws_ec2_instance" group by "account_id";

-- list out all regions and their count
Select "region", count(*) from "fnd"."aws_ec2_instance" group by "region";

-- list out all accounts and regions and their count
Select "account_id", "region", count(*) from "fnd"."aws_ec2_instance" group by "account_id", "region";
