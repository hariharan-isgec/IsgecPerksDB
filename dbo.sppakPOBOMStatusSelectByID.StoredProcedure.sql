USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [PAK_POBOMStatus].*  
  FROM [PAK_POBOMStatus] 
  WHERE
  [PAK_POBOMStatus].[StatusID] = @StatusID
GO
