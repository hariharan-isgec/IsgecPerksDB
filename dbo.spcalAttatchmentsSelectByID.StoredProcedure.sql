USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttatchmentsSelectByID]
  @CallID Int,
  @SerialNo Int 
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
  AND [CAL_Attatchments].[SerialNo] = @SerialNo
GO
