USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkVrfrApplicationsUpdate]
  @Documents Bit,
  @Verified Bit,
  @VerifiedValue Decimal(10,2),
  @VerifiedAmt Decimal(10,2),
  @VerifierRemark NVarChar(100),
  @PaymentMethod NVarChar(20),
  @VerifiedBy Int,
  @VerifiedOn DateTime,
  @StatusID Int,
  @FinYear Int,
  @Original_ApplicationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Applications] SET 
   [Documents] = @Documents
  ,[Verified] = @Verified
  ,[VerifiedValue] = @VerifiedValue
  ,[VerifiedAmt] = @VerifiedAmt
  ,[VerifierRemark] = @VerifierRemark
  ,[PaymentMethod] = @PaymentMethod
  ,[VerifiedBy] = @VerifiedBy
  ,[VerifiedOn] = @VerifiedOn
  ,[StatusID] = @StatusID
  ,[FinYear] = @FinYear
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
