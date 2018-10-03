USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPakTypesSelectByDescription]
  @LoginID NVarChar(8),
  @Description NVarChar(50)  
  AS
  SELECT
    [PAK_PakTypes].*  
  FROM [PAK_PakTypes] 
  WHERE
  LOWER([PAK_PakTypes].[Description]) = LOWER(@Description)
GO
