USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGApplicationsSelectByID]
  @ApplicationID Int
  AS
  SELECT
		[SYS_Applications].[ApplicationID],
		[SYS_Applications].[Description],
		[SYS_Applications].[WebPath],
		[SYS_Applications].[GenerateDefaults] 
  FROM [SYS_Applications] 
  WHERE
  [SYS_Applications].[ApplicationID] = @ApplicationID
GO
