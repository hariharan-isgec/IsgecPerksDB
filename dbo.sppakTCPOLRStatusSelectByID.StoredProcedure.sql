USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLRStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [PAK_POLineRecStatus].*  
  FROM [PAK_POLineRecStatus] 
  WHERE
  [PAK_POLineRecStatus].[StatusID] = @StatusID
GO
