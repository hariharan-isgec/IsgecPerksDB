USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosMailCategoriesSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @Active Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CategoryID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CategoryID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_MailCategories].[CategoryID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_MailCategories] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [TOS_MailCategories].[Active] = ''' + CONVERT(NVarChar(10), @Active) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CategoryID' THEN '[TOS_MailCategories].[CategoryID]'
                        WHEN 'CategoryID DESC' THEN '[TOS_MailCategories].[CategoryID] DESC'
                        WHEN 'Description' THEN '[TOS_MailCategories].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_MailCategories].[Description] DESC'
                        WHEN 'Active' THEN '[TOS_MailCategories].[Active]'
                        WHEN 'Active DESC' THEN '[TOS_MailCategories].[Active] DESC'
                        WHEN 'Sequence' THEN '[TOS_MailCategories].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[TOS_MailCategories].[Sequence] DESC'
                        ELSE '[TOS_MailCategories].[CategoryID]'
                    END
  EXEC (@LGSQL)

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
