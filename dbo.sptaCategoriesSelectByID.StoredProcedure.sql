USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCategoriesSelectByID]
  @LoginID NVarChar(8),
  @CategoryID Int 
  AS
  SELECT
		[TA_Categories].[CategoryID] ,
		[TA_Categories].[CategoryCode] ,
		[TA_Categories].[CategoryDescription] ,
		[TA_Categories].[CategorySequence] ,
		[TA_Categories].[cmba]  
  FROM [TA_Categories] 
  WHERE
  [TA_Categories].[CategoryID] = @CategoryID
GO
