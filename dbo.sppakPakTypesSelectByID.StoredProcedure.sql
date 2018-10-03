USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesSelectByID]
  @LoginID NVarChar(8),
  @PackTypeID Int 
  AS
  SELECT
    [PAK_PakTypes].*  
  FROM [PAK_PakTypes] 
  WHERE
  [PAK_PakTypes].[PackTypeID] = @PackTypeID
GO
