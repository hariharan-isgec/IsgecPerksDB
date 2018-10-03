USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakTCPOLStatusSelectByID]
  @LoginID NVarChar(8),
  @ItemStatusID Int 
  AS
  SELECT
    [PAK_POLineStatus].*  
  FROM [PAK_POLineStatus] 
  WHERE
  [PAK_POLineStatus].[ItemStatusID] = @ItemStatusID
GO
