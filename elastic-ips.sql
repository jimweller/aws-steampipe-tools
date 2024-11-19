-- See if we are using a specific IP. Comes up a lot with security or AWS abuse reports
-- Not this is querying an aggregator in steampipe which includes all foundation AND deliver
-- accounts
select public_ip from hyl.aws_vpc_eip where public_ip='52.71.223.35'