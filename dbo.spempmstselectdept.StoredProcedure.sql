USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spempmstselectdept]
AS
	select deptname from empmst group by deptname
	order by deptname
GO
