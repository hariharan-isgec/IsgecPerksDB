USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [PAK_PkgStatus].*  
  FROM [PAK_PkgStatus] 
  WHERE
  [PAK_PkgStatus].[StatusID] = @StatusID
GO
