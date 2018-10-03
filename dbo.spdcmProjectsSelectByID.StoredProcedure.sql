USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectsSelectByID]
  @ProjectID NVarChar(6) 
  AS
  SELECT
		[DCM_Projects].[ProjectID],
		[DCM_Projects].[Description] 
  FROM [DCM_Projects] 
  WHERE
  [DCM_Projects].[ProjectID] = @ProjectID
GO
