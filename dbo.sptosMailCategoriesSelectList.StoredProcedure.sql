USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosMailCategoriesSelectList]
  @Active Bit,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[TOS_MailCategories].[CategoryID] ,
		[TOS_MailCategories].[Description] ,
		[TOS_MailCategories].[Active] ,
		[TOS_MailCategories].[Sequence]  
  FROM [TOS_MailCategories] 
  WHERE 1 = 1  
  AND [TOS_MailCategories].[Active] = (@Active)  
  ORDER BY
     CASE @OrderBy WHEN 'CategoryID' THEN [TOS_MailCategories].[CategoryID] END,
     CASE @OrderBy WHEN 'CategoryID DESC' THEN [TOS_MailCategories].[CategoryID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_MailCategories].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_MailCategories].[Description] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOS_MailCategories].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOS_MailCategories].[Active] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [TOS_MailCategories].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [TOS_MailCategories].[Sequence] END DESC 
  SET @RecordCount = @@RowCount
GO
