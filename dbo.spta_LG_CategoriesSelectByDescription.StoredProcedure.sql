USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spta_LG_CategoriesSelectByDescription]
  @LoginID NVarChar(8),
  @Description NVarChar(10)  
  AS
  SELECT
		[TA_Categories].[CategoryID] ,
		[TA_Categories].[CategoryCode] ,
		[TA_Categories].[CategoryDescription] ,
		[TA_Categories].[CategorySequence] ,
		[TA_Categories].[cmba]  
  FROM [TA_Categories] 
  WHERE
  [TA_Categories].[CategoryCode] = @Description
GO
