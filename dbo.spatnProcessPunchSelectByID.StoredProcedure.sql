USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnProcessPunchSelectByID]
  @RecordID Int
  AS
  SELECT
		[ATN_ProcessPunch].[RecordID],
		[ATN_ProcessPunch].[ProcessDate],
		[ATN_ProcessPunch].[Processed],
		[ATN_ProcessPunch].[FinYear] 
  FROM [ATN_ProcessPunch] 
  WHERE
  [ATN_ProcessPunch].[RecordID] = @RecordID
GO
