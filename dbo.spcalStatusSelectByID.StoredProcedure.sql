USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusSelectByID]
  @CallStatusID Int
  AS
  SELECT
		[CAL_Status].[CallStatusID],
		[CAL_Status].[Description] 
  FROM [CAL_Status] 
  WHERE
  [CAL_Status].[CallStatusID] = @CallStatusID
GO
