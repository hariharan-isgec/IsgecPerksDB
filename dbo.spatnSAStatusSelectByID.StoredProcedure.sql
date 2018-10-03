USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSAStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [ATN_SAStatus].*  
  FROM [ATN_SAStatus] 
  WHERE
  [ATN_SAStatus].[StatusID] = @StatusID
GO
