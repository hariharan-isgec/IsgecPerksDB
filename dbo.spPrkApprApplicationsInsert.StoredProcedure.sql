USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkApprApplicationsInsert]
  @Approved Bit,
  @ApprovedValue Decimal(10,2),
  @ApprovedAmt Decimal(10,2),
  @ApprovedBy Int,
  @ApprovedOn DateTime,
  @ApproverRemark NVarChar(100),
  @PaymentMethod NVarChar(20),
  @StatusID Int,
  @FinYear Int,
  @ApplicationID Int = null OUTPUT
  AS
  INSERT [PRK_Applications]
  (
   [Approved]
  ,[ApprovedValue]
  ,[ApprovedAmt]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[ApproverRemark]
  ,[PaymentMethod]
  ,[StatusID]
  ,[FinYear]
  )
  VALUES
  (
   @Approved
  ,@ApprovedValue
  ,@ApprovedAmt
  ,@ApprovedBy
  ,@ApprovedOn
  ,@ApproverRemark
  ,@PaymentMethod
  ,@StatusID
  ,@FinYear
  )
  SET @ApplicationID = Scope_Identity()
GO
