USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesSelectByID]
  @CallTypeID Int
  AS
  SELECT
		[CAL_CallTypes].[CallTypeID],
		[CAL_CallTypes].[Description],
		[CAL_CallTypes].[Priority],
		[CAL_CallTypes].[ResponseTime],
		[CAL_Priority1].[Priority] AS CAL_Priority1_Priority,
		[CAL_Priority1].[Description] AS CAL_Priority1_Description 
  FROM [CAL_CallTypes] 
  LEFT OUTER JOIN [CAL_Priority] AS [CAL_Priority1]
    ON [CAL_CallTypes].[Priority] = [CAL_Priority1].[Priority]
  WHERE
  [CAL_CallTypes].[CallTypeID] = @CallTypeID
GO
