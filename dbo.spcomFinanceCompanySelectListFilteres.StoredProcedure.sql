USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomFinanceCompanySelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinanceCompany NVarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinanceCompany'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SYS_FinanceCompany].[FinanceCompany]'
  SET @LGSQL = @LGSQL + ' FROM [SYS_FinanceCompany] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinanceCompany' THEN '[SYS_FinanceCompany].[FinanceCompany]'
                        WHEN 'FinanceCompany DESC' THEN '[SYS_FinanceCompany].[FinanceCompany] DESC'
                        WHEN 'CompanyName' THEN '[SYS_FinanceCompany].[CompanyName]'
                        WHEN 'CompanyName DESC' THEN '[SYS_FinanceCompany].[CompanyName] DESC'
                        WHEN 'LogisticCompany' THEN '[SYS_FinanceCompany].[LogisticCompany]'
                        WHEN 'LogisticCompany DESC' THEN '[SYS_FinanceCompany].[LogisticCompany] DESC'
                        ELSE '[SYS_FinanceCompany].[FinanceCompany]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SYS_FinanceCompany].*  
  FROM [SYS_FinanceCompany] 
      INNER JOIN #PageIndex
          ON [SYS_FinanceCompany].[FinanceCompany] = #PageIndex.FinanceCompany
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
