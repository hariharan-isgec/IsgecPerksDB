USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApplicationStatusSelectByID]
  @ApplStatusID Int
  AS
  SELECT
		[ATN_ApplicationStatus].[ApplStatusID],
		[ATN_ApplicationStatus].[Description] 
  FROM [ATN_ApplicationStatus] 
  WHERE
  [ATN_ApplicationStatus].[ApplStatusID] = @ApplStatusID
GO
