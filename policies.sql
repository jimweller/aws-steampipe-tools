-- Check for AWS Global Condition Context Keys
-- important for moving accounts between orgs
select 'iam_user_inline' as policy_type, name as policy_name, inline_policies as policy_statement 
from lxk.aws_iam_user
where
(
	inline_policies::text like '%aws:PrincipleOrgId%'
	OR inline_policies::text like '%aws:PrincipalOrgPaths%'
	OR inline_policies::text like '%aws:ResourceOrgID%'
	OR inline_policies::text like '%aws:ResourceOrgPaths%'
)

UNION
select 'iam_group_inline' as policy_type, name as policy_name, inline_policies as policy_statement 
from lxk.aws_iam_group
where
(
	inline_policies::text like '%aws:PrincipleOrgId%'
	OR inline_policies::text like '%aws:PrincipalOrgPaths%'
	OR inline_policies::text like '%aws:ResourceOrgID%'
	OR inline_policies::text like '%aws:ResourceOrgPaths%'
)

UNION
select 'iam_role_inline' as policy_type, name as policy_name, inline_policies as policy_statement 
from lxk.aws_iam_role
where
(
	inline_policies::text like '%aws:PrincipleOrgId%'
	OR inline_policies::text like '%aws:PrincipalOrgPaths%'
	OR inline_policies::text like '%aws:ResourceOrgID%'
	OR inline_policies::text like '%aws:ResourceOrgPaths%'
)

UNION
select 'iam_policy' as policy_type, name as policy_name, policy as policy_statement 
from lxk.aws_iam_policy
where
(
	policy::text like '%aws:PrincipleOrgId%'
	OR policy::text like '%aws:PrincipalOrgPaths%'
	OR policy::text like '%aws:ResourceOrgID%'
	OR policy::text like '%aws:ResourceOrgPaths%'
)
