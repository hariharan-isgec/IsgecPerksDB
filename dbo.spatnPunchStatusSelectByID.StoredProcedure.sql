USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusSelectByID]
  @PunchStatusID NVarChar(2)
  AS
  SELECT
		[ATN_PunchStatus].[PunchStatusID],
		[ATN_PunchStatus].[Description],
		[ATN_PunchStatus].[PunchValue] 
  FROM [ATN_PunchStatus] 
  WHERE
  [ATN_PunchStatus].[PunchStatusID] = @PunchStatusID
GO
