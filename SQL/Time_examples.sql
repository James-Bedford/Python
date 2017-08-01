if exists (select * from sys.objects WHERE object_id = object_id(N'dbo.t') AND type in (N'U'))
drop table dbo.t
create table dbo.t (dt datetime not null)
insert into dbo.t values ('20100819 05:00')
insert into dbo.t values ('20100819 07:00')
insert into dbo.t values ('20100819 23:00')
insert into dbo.t values ('20100820 04:00')
insert into dbo.t values ('20100820 11:00')
insert into dbo.t values ('20100820 13:00')
insert into dbo.t values ('20100821 00:45')
select convert(date,dateadd(HH,-6,dt)) as [Date],
COUNT(dt) as [Count]
from dbo.t
group by convert(date,dateadd(HH,-6,dt))
SELECT CONVERT(VARCHAR(10),date_column,112),SUM(num_col) AS summed
FROM table_name
GROUP BY CONVERT(VARCHAR(10),date_column,112)

;with cte as(
    select 
        cast(utcdate as date) UtcDay, DATEPART(hour, utcdate) UtcHour, count(*) as Counts
    from dbo.mytable cd 
    where utcdate between '2014-01-14' and '2014-01-15'
    group by
        cast(utcdate as date), DATEPART(hour, utcdate)
)
select dateadd(hour, utchour, cast(utcday as datetime)) as UTCDateHour, Counts
from cte

SELECT COUNT(*), 
       DATEADD(dd, DATEDIFF(dd, 0, date_field),0) as dtgroup 
FROM TABLE 
GROUP BY DATEADD(dd, DATEDIFF(dd, 0, date_field),0) 
ORDER BY dtgroup ASC;

DECLARE @StartDateTime DATETIME
DECLARE @EndDateTime DATETIME
DECLARE @CurrentDateTime DATETIME
SELECT @CurrentDateTime = DATEADD(MINUTE, 630, GETDATE())


SELECT @StartDateTime = CASE WHEN @CurrentDateTime < DATEADD(HH, 6, CONVERT(char(11), @CurrentDateTime, 113)) THEN DATEADD(HH, 18, DATEADD(dd, -1, CONVERT(char(11), @CurrentDateTime, 113)))
					  WHEN  @CurrentDateTime >= DATEADD(HH, 18, CONVERT(char(11), @CurrentDateTime, 113)) THEN DATEADD(HH, 18, CONVERT(char(11), @CurrentDateTime, 113))

Select CurveDataId,CurveId,Datename(DAY,ValueDate) as Day,DATENAME(Month,ValueDate)as Month,DATEName(YEAR,ValueDate) as Year,DateNAME(Hour,ValueDate) as Hour,DATENAME(Minute,VALUEDate) as Minute,Value
  Select * 
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'
  --and ValueDate < '2017-04-09 05:59:00.000'
  --group by DATEPART(HOUR, [ValueDate])--< 6 THEN DATEADD(DAY, -1, CAST([ValueDate] AS DATE)
  --group by CAST( ValueDate as DATE)
  GROUP BY CONVERT(CHAR(8),ValueDate,10)
  order by ValueDate asc

  --summarises but by 24 hours
  select count(convert(CHAR(10), valueDate, 103) ),convert(char(10), valueDate, 103),Sum(value)as Total
   FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'

  GROUP BY CONVERT(CHAR(10),valueDate,103)
  ORDER BY CONVERT(CHAR(10),valueDate,103)

  --need Gas Day summary
 SELECT CAST(valueDate as date) as Start,datepart(hour,valuedate) as onhour,count(*) as totals
  FROM [PointConnect].[pointconnect].[CurveData]
  where 
  CurveId in(103944792)
  and ValueDate > '2017-04-08 05:00:00.000'
  GROUP BY CAST (ValueDate as date),DATEPART(hour,ValueDate)
 
 --summary by hour
 SELECT  CAST(valueDate as DATE) as 'StartDate', 
        CAST(DATEPART(Hour, valueDate) as varchar) + ':59' as 'Hour', 
        COUNT(*) as 'Ct',sum(value)
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944792)
 AND ValueDate > '2017-04-08 05:00:00.000'
GROUP BY CAST(valueDate as DATE), DATEPART(Hour, valueDate)
ORDER BY CAST(valueDate as DATE) ASC

 SELECT  CAST(valueDate as DATE) as 'StartDate', 
        --CAST(DATEPART(Day, valueDate) as varchar) + ':59' as 'Hour', 
        COUNT(*) as 'Number of rows',sum(value)
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944792)
 AND ValueDate > '2017-04-08 06:00:00.000'
GROUP BY CAST(valueDate as DATE)--, DATEPART(Day, valueDate)
ORDER BY CAST(valueDate as DATE) ASC

--now by gas day
select convert(date,dateadd(HH,-6,valueDate)) as [Gas_Day],
COUNT(valueDate) as [Count],sum(value)as[ Mcm]
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944792)
 AND ValueDate > '2017-04-08 06:00:00.000'
group by convert(date,dateadd(HH,-6,valueDate))

 SELECT  CAST(valueDate as DATE) as 'StartDate', 
        --CAST(DATEPART(Day, valueDate) as varchar) + ':59' as 'Hour', 
        COUNT(*) as 'Number of rows',sum(value)
 FROM [PointConnect].[pointconnect].[CurveData]
 WHERE CurveId in(103944792)
 AND ValueDate > '2017-04-08 06:00:00.000'
GROUP BY CAST(valueDate as DATE)--, DATEPART(Day, valueDate)
ORDER BY CAST(valueDate as DATE) ASC