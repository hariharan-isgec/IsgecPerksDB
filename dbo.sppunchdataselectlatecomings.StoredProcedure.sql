USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppunchdataselectlatecomings]
@deptnamef nvarchar(30),
@deptnamet nvarchar(30),
@dPunchtimef	datetime,
@dPunchtimet	datetime,
@tPunchtimef	nvarchar(5),
@tPunchtimet	nvarchar(5)
AS
if (upper(ltrim(rtrim(@deptnamef))) = 'ALL')
BEGIN
	SELECT empmst.cardno, empmst.empname, desigmst.designame, punchdata.punchtime, empmst.deptname
	FROM dbo.empmst LEFT OUTER JOIN dbo.desigmst ON dbo.empmst.desigcode = dbo.desigmst.desigcode 
	INNER JOIN dbo.punchdata ON dbo.empmst.cardno = dbo.punchdata.cardno
	where punchdata.punchtime between @dPunchtimef and @dPunchtimet	
	and convert(nvarchar(5), punchtime, 108) between @tPunchtimef and @tPunchtimet
	and convert(nvarchar(5), punchtime, 108) = 
	(select min(convert(nvarchar(5), p1.punchtime, 108)) from punchdata p1 where p1.cardno = empmst.cardno
	and CONVERT(VARCHAR(10), p1.punchtime, 103)  = CONVERT(VARCHAR(10), punchdata.punchtime, 103))
	ORDER BY empmst.deptname, empmst.cardno,punchdata.punchtime
END
Else
BEGIN
	SELECT empmst.cardno, empmst.empname, desigmst.designame, punchdata.punchtime, empmst.deptname
	FROM dbo.empmst LEFT OUTER JOIN dbo.desigmst ON dbo.empmst.desigcode = dbo.desigmst.desigcode 
	INNER JOIN dbo.punchdata ON dbo.empmst.cardno = dbo.punchdata.cardno
	where upper(ltrim(rtrim(empmst.deptname))) between upper(ltrim(rtrim(@deptnamef))) and upper(ltrim(rtrim(@deptnamet)))
	and punchdata.punchtime between @dPunchtimef and @dPunchtimet
	and convert(nvarchar(5), punchtime, 108) between @tPunchtimef and @tPunchtimet
	and convert(nvarchar(5), punchtime, 108) = 
	(select min(convert(nvarchar(5), p1.punchtime, 108)) from punchdata p1 where p1.cardno = empmst.cardno
	and CONVERT(VARCHAR(10), p1.punchtime, 103)  = CONVERT(VARCHAR(10), punchdata.punchtime, 103))
	ORDER BY empmst.deptname, empmst.cardno,punchdata.punchtime
END
GO
