USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_Dates]
  AS
declare @start datetime,
@end datetime

set @start = '2014-01-01'
set @end = '2016-01-01'
;
with calendar(date,isweekday, y, q,m,d,dw,monthname,dayname,w) as
(
select @start ,
case when datepart(dw,@start) in (1,7) then 0 else 1 end,
year(@start),
datepart(qq,@start),
datepart(mm,@start),
datepart(dd,@start),
datepart(dw,@start),
datename(month, @start),
datename(dw, @start),
datepart(wk, @start)
union all
select date + 1,
case when datepart(dw,date + 1) in (1,7) then 0 else 1 end,
year(date + 1),
datepart(qq,date + 1),
datepart(mm,date + 1),
datepart(dd,date + 1),
datepart(dw,date + 1),
datename(month, date + 1),
datename(dw, date + 1),
datepart(wk, date + 1) from calendar where date + 1< @end
)
select * into QCM_Dates from calendar option(maxrecursion 10000)
GO
