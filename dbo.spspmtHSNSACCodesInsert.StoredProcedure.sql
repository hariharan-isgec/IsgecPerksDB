USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtHSNSACCodesInsert]
  @BillType Int,
  @HSNSACCode NVarChar(20),
  @Description NVarChar(500),
  @TaxRate Decimal(18,6),
  @Return_BillType Int = null OUTPUT, 
  @Return_HSNSACCode NVarChar(20) = null OUTPUT 
  AS
  INSERT [SPMT_HSNSACCodes]
  (
   [BillType]
  ,[HSNSACCode]
  ,[Description]
  ,[TaxRate]
  )
  VALUES
  (
   @BillType
  ,UPPER(@HSNSACCode)
  ,@Description
  ,@TaxRate
  )
  SET @Return_BillType = @BillType
  SET @Return_HSNSACCode = @HSNSACCode
GO
