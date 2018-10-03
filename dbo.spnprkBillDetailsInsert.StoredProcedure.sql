USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkBillDetailsInsert]
  @ClaimID Int,
  @ApplicationID Int,
  @BillNo NVarChar(20),
  @BillDate DateTime,
  @FromDate DateTime,
  @ToDate DateTime,
  @Description NVarChar(250),
  @Particulars NVarChar(250),
  @Quantity Decimal(18,2),
  @Amount Decimal(18,2),
  @SerialNo Int,
  @WithDriver Bit,
  @VerifiedByAdmin Bit,
  @EntitlementID Int,
  @PerkID Int,
  @Return_ClaimID Int = null OUTPUT, 
  @Return_ApplicationID Int = null OUTPUT, 
  @Return_AttachmentID Int = null OUTPUT 
  AS
  INSERT [PRK_BillDetails]
  (
   [ClaimID]
  ,[ApplicationID]
  ,[BillNo]
  ,[BillDate]
  ,[FromDate]
  ,[ToDate]
  ,[Description]
  ,[Particulars]
  ,[Quantity]
  ,[Amount]
  ,[SerialNo]
  ,[WithDriver]
  ,[VerifiedByAdmin]
  ,[EntitlementID]
  ,[PerkID]
  )
  VALUES
  (
   @ClaimID
  ,@ApplicationID
  ,@BillNo
  ,@BillDate
  ,@FromDate
  ,@ToDate
  ,@Description
  ,@Particulars
  ,@Quantity
  ,@Amount
  ,@SerialNo
  ,@WithDriver
  ,@VerifiedByAdmin
  ,@EntitlementID
  ,@PerkID
  )
  SET @Return_ClaimID = @ClaimID
  SET @Return_ApplicationID = @ApplicationID
  SET @Return_AttachmentID = Scope_Identity()
GO
