USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [PAK_POStatus].*  
  FROM [PAK_POStatus] 
  WHERE
  [PAK_POStatus].[StatusID] = @StatusID
GO
