USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOTypesSelectByID]
  @LoginID NVarChar(8),
  @POTypeID Int 
  AS
  SELECT
    [PAK_POTypes].*  
  FROM [PAK_POTypes] 
  WHERE
  [PAK_POTypes].[POTypeID] = @POTypeID
GO
