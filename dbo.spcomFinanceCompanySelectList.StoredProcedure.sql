USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomFinanceCompanySelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [SYS_FinanceCompany].*  
  FROM [SYS_FinanceCompany] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'FinanceCompany' THEN [SYS_FinanceCompany].[FinanceCompany] END,
     CASE @OrderBy WHEN 'FinanceCompany DESC' THEN [SYS_FinanceCompany].[FinanceCompany] END DESC,
     CASE @OrderBy WHEN 'CompanyName' THEN [SYS_FinanceCompany].[CompanyName] END,
     CASE @OrderBy WHEN 'CompanyName DESC' THEN [SYS_FinanceCompany].[CompanyName] END DESC,
     CASE @OrderBy WHEN 'LogisticCompany' THEN [SYS_FinanceCompany].[LogisticCompany] END,
     CASE @OrderBy WHEN 'LogisticCompany DESC' THEN [SYS_FinanceCompany].[LogisticCompany] END DESC 
  SET @RecordCount = @@RowCount
GO
