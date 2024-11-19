
-- You must have a log_group_name to query actual events. Get the list of trail names first.
select distinct name from d_717027952892.aws_cloudtrail_trail

-- Find events with an event source in a date range
select event_source from d_717027952892.aws_cloudtrail_trail_event 
	where log_group_name='h-ice-event-logs' 
	and event_source='textract.amazonaws.com'
	and timestamp between '2024-03-01 00:00:00' and '2024-03-31 11:59:59'
	limit 100


-- Find events with an event name in a date range
select event_name from d_717027952892.aws_cloudtrail_trail_event 
	where log_group_name='h-ice-event-logs' 
	and event_name='AnalyzeDocument'
	and timestamp between '2024-03-01 00:00:00' and '2024-03-31 11:59:59'
	limit 100
