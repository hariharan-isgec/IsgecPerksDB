USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmProjectsSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6) 
  AS
  SELECT * 
  FROM [IDM_Projects] 
  WHERE
  [IDM_Projects].[ProjectID] = @ProjectID
GO
