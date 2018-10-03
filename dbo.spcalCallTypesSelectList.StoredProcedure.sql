USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  ORDER BY
     CASE @orderBy WHEN 'CallTypeID' THEN [CAL_CallTypes].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [CAL_CallTypes].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [CAL_CallTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [CAL_CallTypes].[Description] END DESC,
     CASE @orderBy WHEN 'Priority' THEN [CAL_CallTypes].[Priority] END,
     CASE @orderBy WHEN 'Priority DESC' THEN [CAL_CallTypes].[Priority] END DESC,
     CASE @orderBy WHEN 'ResponseTime' THEN [CAL_CallTypes].[ResponseTime] END,
     CASE @orderBy WHEN 'ResponseTime DESC' THEN [CAL_CallTypes].[ResponseTime] END DESC,
     CASE @orderBy WHEN 'CAL_Priority1_Priority' THEN [CAL_Priority1].[Priority] END,
     CASE @orderBy WHEN 'CAL_Priority1_Priority DESC' THEN [CAL_Priority1].[Priority] END DESC,
     CASE @orderBy WHEN 'CAL_Priority1_Description' THEN [CAL_Priority1].[Description] END,
     CASE @orderBy WHEN 'CAL_Priority1_Description DESC' THEN [CAL_Priority1].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
