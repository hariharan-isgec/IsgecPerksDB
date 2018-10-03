USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkUserClaimsInsert]
  @Description NVarChar(250),
  @CardNo NVarChar(8),
  @PassedAmount Decimal(12,2),
  @TotalAmount Decimal(12,2),
  @DeclarationAccepted Bit,
  @SubmittedOn DateTime,
  @ReceivedOn DateTime,
  @ReceivedBy NVarChar(8),
  @ReturnedOn DateTime,
  @ReturnedBy NVarChar(8),
  @CompletedOn DateTime,
  @AccountsRemarks NVarChar(250),
  @ClaimStatusID Int,
  @ClaimRefNo NVarChar(50),
  @FinYear Int,
  @forRef Int,
  @VerifiedBy NVarChar(8),
  @VerifiedOn DateTime,
  @Return_ClaimID Int = null OUTPUT 
  AS
  INSERT [PRK_UserClaims]
  (
   [Description]
  ,[CardNo]
  ,[PassedAmount]
  ,[TotalAmount]
  ,[DeclarationAccepted]
  ,[SubmittedOn]
  ,[ReceivedOn]
  ,[ReceivedBy]
  ,[ReturnedOn]
  ,[ReturnedBy]
  ,[CompletedOn]
  ,[AccountsRemarks]
  ,[ClaimStatusID]
  ,[ClaimRefNo]
  ,[FinYear]
  ,[forRef]
  ,[VerifiedBy]
  ,[VerifiedOn]
  )
  VALUES
  (
   @Description
  ,@CardNo
  ,@PassedAmount
  ,@TotalAmount
  ,@DeclarationAccepted
  ,@SubmittedOn
  ,@ReceivedOn
  ,@ReceivedBy
  ,@ReturnedOn
  ,@ReturnedBy
  ,@CompletedOn
  ,@AccountsRemarks
  ,@ClaimStatusID
  ,@ClaimRefNo
  ,@FinYear
  ,@forRef
  ,@VerifiedBy
  ,@VerifiedOn
  )
  SET @Return_ClaimID = Scope_Identity()
GO
