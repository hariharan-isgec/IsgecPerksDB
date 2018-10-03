USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomFinanceCompanyInsert]
  @FinanceCompany NVarChar(10),
  @CompanyName NVarChar(100),
  @LogisticCompany NVarChar(10),
  @Return_FinanceCompany NVarChar(10) = null OUTPUT 
  AS
  INSERT [SYS_FinanceCompany]
  (
   [FinanceCompany]
  ,[CompanyName]
  ,[LogisticCompany]
  )
  VALUES
  (
   UPPER(@FinanceCompany)
  ,@CompanyName
  ,@LogisticCompany
  )
  SET @Return_FinanceCompany = @FinanceCompany
GO
