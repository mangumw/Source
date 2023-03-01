USE [ReportData]
GO
/****** Object:  StoredProcedure [dbo].[rpt_Salvation_Army_District]    Script Date: 8/19/2022 3:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rpt_Salvation_Army_District]
as
select	t1.District_Number,
		sum(t2.Current_Units) as SLSU,
		sum(t2.current_dollars) as SLSD,
		0 as goal
into	#district
from	reference.dbo.Salvation_Army_Goals t1 join 
		dssdata.dbo.Salvation_army_collection t2
on    	t2.store_number = t1.store_number
and		t2.day_date > '11-01-2009'
and		t2.Current_dollars > -5
group by t1.district_number
--
select	district_number,
		sum(goal) as Goal
into	#goal
from	reference.dbo.salvation_army_goals
group by district_Number
--
update #district set goal = #goal.goal from #goal
                          where #goal.district_number = #district.district_number
--
select * from #district

GO
