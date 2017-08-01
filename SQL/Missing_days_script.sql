/*Script creates a temp table loaded with calendar days 
You then run your curve poulation query against it and teh dates returned are missing days in the curve.
*/


create Table #calendar(d DateTime, Primary Key (d))

drop Table #calendar

DECLARE @dIncr DATE = '2012-01-01'
DECLARE @dEnd DATE = '2017-07-07'
WHILE ( @dIncr < @dEnd )
BEGIN
	INSERT INTO #calendar (d) values( @dIncr)
	SELECT @dIncr = DATEADD(DAY,1,@dIncr)
END


--Returns only rows not in [PointConnect].[pointconnect].[CurveData]
--However not sure why it will still miss teh first missing date - somethign to do with except
SELECT CONVERT(DATE, d,101)as Missing_days
FROM #CALENDAR
--where d >'2011-12-31'
--and d < '2017-07-04'
EXCEPT
SELECT CONVERT(DATE,ValueDate,101)
FROM [PointConnect].[pointconnect].[CurveData]
where CurveId in(103638459)
ORDER BY CONVERT(DATE, d,101)


