USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomFinanceCompanyUpdate]
  @Original_FinanceCompany NVarChar(10), 
  @FinanceCompany NVarChar(10),
  @CompanyName NVarChar(100),
  @LogisticCompany NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_FinanceCompany] SET 
   [FinanceCompany] = @FinanceCompany
  ,[CompanyName] = @CompanyName
  ,[LogisticCompany] = @LogisticCompany
  WHERE
  [FinanceCompany] = @Original_FinanceCompany
  SET @RowCount = @@RowCount
GO
