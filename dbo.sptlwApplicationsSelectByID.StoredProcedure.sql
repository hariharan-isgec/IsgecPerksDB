USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwApplicationsSelectByID]
  @LoginID NVarChar(8),
  @ApplicationID Int 
  AS
  SELECT
    [SYS_Applications].*  
  FROM [SYS_Applications] 
  WHERE
  [SYS_Applications].[ApplicationID] = @ApplicationID
GO
