USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakDivisionsSelectByID]
  @LoginID NVarChar(8),
  @DivisionID Int 
  AS
  SELECT
    [PAK_Divisions].*  
  FROM [PAK_Divisions] 
  WHERE
  [PAK_Divisions].[DivisionID] = @DivisionID
GO
