USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomFinanceCompanySelectByID]
  @LoginID NVarChar(8),
  @FinanceCompany NVarChar(10) 
  AS
  SELECT
    [SYS_FinanceCompany].*  
  FROM [SYS_FinanceCompany] 
  WHERE
  [SYS_FinanceCompany].[FinanceCompany] = @FinanceCompany
GO
