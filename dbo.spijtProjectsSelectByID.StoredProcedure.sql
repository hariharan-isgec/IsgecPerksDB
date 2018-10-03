USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtProjectsSelectByID]
  @ProjectID NVarChar(6) 
  AS
  SELECT
		[IDM_Projects].[ProjectID],
		[IDM_Projects].[Description] 
  FROM [IDM_Projects] 
  WHERE
  [IDM_Projects].[ProjectID] = @ProjectID
GO
