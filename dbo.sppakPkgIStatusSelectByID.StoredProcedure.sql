USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgIStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [PAK_PkgIStatus].*  
  FROM [PAK_PkgIStatus] 
  WHERE
  [PAK_PkgIStatus].[StatusID] = @StatusID
GO
