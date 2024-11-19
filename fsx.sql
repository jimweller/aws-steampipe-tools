-- FSC storage usage
-- for calsaw production
select 
	f.title,
	f.storage_capacity,
	f.storage_type
from 
	f_348632094786.aws_fsx_file_system f
where
	title like 'fsx-example-production%'