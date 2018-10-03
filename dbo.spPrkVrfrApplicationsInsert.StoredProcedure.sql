USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkVrfrApplicationsInsert]
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
  @ApplicationID Int = null OUTPUT
  AS
  INSERT [PRK_Applications]
  (
   [Documents]
  ,[Verified]
  ,[VerifiedValue]
  ,[VerifiedAmt]
  ,[VerifierRemark]
  ,[PaymentMethod]
  ,[VerifiedBy]
  ,[VerifiedOn]
  ,[StatusID]
  ,[FinYear]
  )
  VALUES
  (
   @Documents
  ,@Verified
  ,@VerifiedValue
  ,@VerifiedAmt
  ,@VerifierRemark
  ,@PaymentMethod
  ,@VerifiedBy
  ,@VerifiedOn
  ,@StatusID
  ,@FinYear
  )
  SET @ApplicationID = Scope_Identity()
GO
