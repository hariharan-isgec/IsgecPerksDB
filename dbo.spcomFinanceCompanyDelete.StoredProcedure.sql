USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomFinanceCompanyDelete]
  @Original_FinanceCompany NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_FinanceCompany]
  WHERE
  [SYS_FinanceCompany].[FinanceCompany] = @Original_FinanceCompany
  SET @RowCount = @@RowCount
GO
