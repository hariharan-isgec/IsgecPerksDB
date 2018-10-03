USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomFinanceCompanySelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinanceCompany NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (FinanceCompany)
  SELECT [SYS_FinanceCompany].[FinanceCompany] FROM [SYS_FinanceCompany]
 WHERE  
   ( 
         LOWER(ISNULL([SYS_FinanceCompany].[FinanceCompany],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_FinanceCompany].[CompanyName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SYS_FinanceCompany].[LogisticCompany],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinanceCompany' THEN [SYS_FinanceCompany].[FinanceCompany] END,
     CASE @OrderBy WHEN 'FinanceCompany DESC' THEN [SYS_FinanceCompany].[FinanceCompany] END DESC,
     CASE @OrderBy WHEN 'CompanyName' THEN [SYS_FinanceCompany].[CompanyName] END,
     CASE @OrderBy WHEN 'CompanyName DESC' THEN [SYS_FinanceCompany].[CompanyName] END DESC,
     CASE @OrderBy WHEN 'LogisticCompany' THEN [SYS_FinanceCompany].[LogisticCompany] END,
     CASE @OrderBy WHEN 'LogisticCompany DESC' THEN [SYS_FinanceCompany].[LogisticCompany] END DESC 

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
