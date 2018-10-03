USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttatchmentsSelectByCallID]
  @CallID Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[CAL_Attatchments].[CallID] ,
		[CAL_Attatchments].[SerialNo] ,
		[CAL_Attatchments].[AttatchmentName] ,
		[CAL_Attatchments].[DiskFileName] ,
		[CAL_Attatchments].[IsImage]  
  FROM [CAL_Attatchments] 
  INNER JOIN [CAL_Register] AS [CAL_Register1]
    ON [CAL_Attatchments].[CallID] = [CAL_Register1].[CallID]
  WHERE
  [CAL_Attatchments].[CallID] = @CallID
  ORDER BY
     CASE @orderBy WHEN 'CallID' THEN [CAL_Attatchments].[CallID] END,
     CASE @orderBy WHEN 'CallID DESC' THEN [CAL_Attatchments].[CallID] END DESC,
     CASE @orderBy WHEN 'SerialNo' THEN [CAL_Attatchments].[SerialNo] END,
     CASE @orderBy WHEN 'SerialNo DESC' THEN [CAL_Attatchments].[SerialNo] END DESC,
     CASE @orderBy WHEN 'AttatchmentName' THEN [CAL_Attatchments].[AttatchmentName] END,
     CASE @orderBy WHEN 'AttatchmentName DESC' THEN [CAL_Attatchments].[AttatchmentName] END DESC,
     CASE @orderBy WHEN 'DiskFileName' THEN [CAL_Attatchments].[DiskFileName] END,
     CASE @orderBy WHEN 'DiskFileName DESC' THEN [CAL_Attatchments].[DiskFileName] END DESC,
     CASE @orderBy WHEN 'IsImage' THEN [CAL_Attatchments].[IsImage] END,
     CASE @orderBy WHEN 'IsImage DESC' THEN [CAL_Attatchments].[IsImage] END DESC 
  SET @RecordCount = @@RowCount
GO
