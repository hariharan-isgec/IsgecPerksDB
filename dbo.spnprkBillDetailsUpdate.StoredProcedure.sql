USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkBillDetailsUpdate]
  @Original_ClaimID Int, 
  @Original_ApplicationID Int, 
  @Original_AttachmentID Int, 
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
@RowCount int = null OUTPUT
  AS
  UPDATE [PRK_BillDetails] SET 
   [ClaimID] = @ClaimID
  ,[ApplicationID] = @ApplicationID
  ,[BillNo] = @BillNo
  ,[BillDate] = @BillDate
  ,[FromDate] = @FromDate
  ,[ToDate] = @ToDate
  ,[Description] = @Description
  ,[Particulars] = @Particulars
  ,[Quantity] = @Quantity
  ,[Amount] = @Amount
  ,[SerialNo] = @SerialNo
  ,[WithDriver] = @WithDriver
  ,[VerifiedByAdmin] = @VerifiedByAdmin  
  ,[EntitlementID] = @EntitlementID
  ,[PerkID] = @PerkID 
  WHERE
  [ClaimID] = @Original_ClaimID
  AND [ApplicationID] = @Original_ApplicationID
  AND [AttachmentID] = @Original_AttachmentID
  SET @RowCount = @@RowCount
GO
