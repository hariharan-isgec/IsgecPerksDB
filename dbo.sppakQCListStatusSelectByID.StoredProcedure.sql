USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [PAK_QCListStatus].*  
  FROM [PAK_QCListStatus] 
  WHERE
  [PAK_QCListStatus].[StatusID] = @StatusID
GO
