USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosMailCategoriesSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @Active Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CategoryID Int NOT NULL
  )
  INSERT INTO #PageIndex (CategoryID)
  SELECT [TOS_MailCategories].[CategoryID] FROM [TOS_MailCategories]
 WHERE  
      [TOS_MailCategories].[Active] = (@Active)
   AND ( 
         STR(ISNULL([TOS_MailCategories].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_MailCategories].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_MailCategories].[Sequence], 0)) LIKE @KeyWord1
   ) 
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

  SELECT
		[TOS_MailCategories].[CategoryID] ,
		[TOS_MailCategories].[Description] ,
		[TOS_MailCategories].[Active] ,
		[TOS_MailCategories].[Sequence]  
  FROM [TOS_MailCategories] 
    	INNER JOIN #PageIndex
          ON [TOS_MailCategories].[CategoryID] = #PageIndex.CategoryID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
