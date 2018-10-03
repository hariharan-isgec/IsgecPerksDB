USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectInputStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [COST_ProjectInputStatus].*  
  FROM [COST_ProjectInputStatus] 
  WHERE
  [COST_ProjectInputStatus].[StatusID] = @StatusID
GO
