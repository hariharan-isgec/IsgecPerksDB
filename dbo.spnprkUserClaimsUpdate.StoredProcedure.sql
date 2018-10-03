USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkUserClaimsUpdate]
  @Original_ClaimID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_UserClaims] SET 
   [Description] = @Description
  ,[CardNo] = @CardNo
  ,[PassedAmount] = @PassedAmount
  ,[TotalAmount] = @TotalAmount
  ,[DeclarationAccepted] = @DeclarationAccepted
  ,[SubmittedOn] = @SubmittedOn
  ,[ReceivedOn] = @ReceivedOn
  ,[ReceivedBy] = @ReceivedBy
  ,[ReturnedOn] = @ReturnedOn
  ,[ReturnedBy] = @ReturnedBy
  ,[CompletedOn] = @CompletedOn
  ,[AccountsRemarks] = @AccountsRemarks
  ,[ClaimStatusID] = @ClaimStatusID
  ,[ClaimRefNo] = @ClaimRefNo
  ,[FinYear] = @FinYear
  ,[forRef] = @forRef
  ,[VerifiedBy] = @VerifiedBy
  ,[VerifiedOn] = @VerifiedOn  
  WHERE
  [ClaimID] = @Original_ClaimID
  SET @RowCount = @@RowCount
GO
