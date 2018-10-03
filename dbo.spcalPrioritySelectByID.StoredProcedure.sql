USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPrioritySelectByID]
  @Priority NVarChar(1)
  AS
  SELECT
		[CAL_Priority].[Priority],
		[CAL_Priority].[Description] 
  FROM [CAL_Priority] 
  WHERE
  [CAL_Priority].[Priority] = @Priority
GO
