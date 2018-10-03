USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkApprApplicationsUpdate]
  @Approved Bit,
  @ApprovedValue Decimal(10,2),
  @ApprovedAmt Decimal(10,2),
  @ApprovedBy Int,
  @ApprovedOn DateTime,
  @ApproverRemark NVarChar(100),
  @PaymentMethod NVarChar(20),
  @StatusID Int,
  @FinYear Int,
  @Original_ApplicationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Applications] SET 
   [Approved] = @Approved
  ,[ApprovedValue] = @ApprovedValue
  ,[ApprovedAmt] = @ApprovedAmt
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[ApproverRemark] = @ApproverRemark
  ,[PaymentMethod] = @PaymentMethod
  ,[StatusID] = @StatusID
  ,[FinYear] = @FinYear
  WHERE
  [ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO
