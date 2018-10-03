USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmProjectsSelectByID]
  @ProjectCode NVarChar(6)
  AS
  SELECT
		[DCM_Projects].[ProjectCode],
		[DCM_Projects].[Description] 
  FROM [DCM_Projects] 
  WHERE
  [DCM_Projects].[ProjectCode] = @ProjectCode
GO
