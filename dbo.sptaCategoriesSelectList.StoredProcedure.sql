USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCategoriesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TA_Categories].[CategoryID] ,
		[TA_Categories].[CategoryCode] ,
		[TA_Categories].[CategoryDescription] ,
		[TA_Categories].[CategorySequence] ,
		[TA_Categories].[cmba]  
  FROM [TA_Categories] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'CategoryID' THEN [TA_Categories].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TA_Categories].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'CategoryCode' THEN [TA_Categories].[CategoryCode] END,
     CASE @OrderBy WHEN 'CategoryCode DESC' THEN [TA_Categories].[CategoryCode] END DESC,
     CASE @OrderBy WHEN 'CategoryDescription' THEN [TA_Categories].[CategoryDescription] END,
     CASE @OrderBy WHEN 'CategoryDescription DESC' THEN [TA_Categories].[CategoryDescription] END DESC,
     CASE @OrderBy WHEN 'CategorySequence' THEN [TA_Categories].[CategorySequence] END,
     CASE @OrderBy WHEN 'CategorySequence DESC' THEN [TA_Categories].[CategorySequence] END DESC 
  SET @RecordCount = @@RowCount
GO
