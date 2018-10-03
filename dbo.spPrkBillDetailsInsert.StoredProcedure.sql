USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkBillDetailsInsert]
  @ApplicationID Int,
  @SerialNo Int,
  @BillNo NVarChar(20),
  @BillDate DateTime,
  @Particulars NVarChar(250),
  @Quantity Decimal(18,2),
  @Amount Decimal(18,2),
  @AttachmentID Int = null OUTPUT
  AS
  INSERT [PRK_BillDetails]
  (
   [ApplicationID]
  ,[SerialNo]
  ,[BillNo]
  ,[BillDate]
  ,[Particulars]
  ,[Quantity]
  ,[Amount]
  )
  VALUES
  (
   @ApplicationID
  ,@SerialNo
  ,@BillNo
  ,@BillDate
  ,@Particulars
  ,@Quantity
  ,@Amount
  )
  SET @AttachmentID = Scope_Identity()
GO
