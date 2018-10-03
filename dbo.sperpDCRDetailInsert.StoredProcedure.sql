USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRDetailInsert]
  @DCRNo NVarChar(10),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(5),
  @IndentNo NVarChar(10),
  @IndentLine NVarChar(5),
  @LotItem NVarChar(50),
  @ItemDescription NVarChar(100),
  @IndenterID NVarChar(8),
  @BuyerID NVarChar(8),
  @OrderNo NVarChar(10),
  @OrderLine NVarChar(5),
  @SupplierID NVarChar(10),
  @BuyerIDinPO NVarChar(8),
  @IndenterName NVarChar(50),
  @IndenterEMail NVarChar(50),
  @BuyerName NVarChar(50),
  @BuyerEMail NVarChar(50),
  @BuyerIDinPOName NVarChar(50),
  @BuyerIDinPOEMail NVarChar(50),
  @SupplierName NVarChar(100),
  @DocumentTitle NVarChar(100),
  @Return_DCRNo NVarChar(10) = null OUTPUT, 
  @Return_DocumentID NVarChar(30) = null OUTPUT, 
  @Return_RevisionNo NVarChar(5) = null OUTPUT 
  AS
  INSERT [ERP_DCRDetail]
  (
   [DCRNo]
  ,[DocumentID]
  ,[RevisionNo]
  ,[IndentNo]
  ,[IndentLine]
  ,[LotItem]
  ,[ItemDescription]
  ,[IndenterID]
  ,[BuyerID]
  ,[OrderNo]
  ,[OrderLine]
  ,[SupplierID]
  ,[BuyerIDinPO]
  ,[IndenterName]
  ,[IndenterEMail]
  ,[BuyerName]
  ,[BuyerEMail]
  ,[BuyerIDinPOName]
  ,[BuyerIDinPOEMail]
  ,[SupplierName]
  ,[DocumentTitle]
  )
  VALUES
  (
   UPPER(@DCRNo)
  ,UPPER(@DocumentID)
  ,UPPER(@RevisionNo)
  ,@IndentNo
  ,@IndentLine
  ,@LotItem
  ,@ItemDescription
  ,@IndenterID
  ,@BuyerID
  ,@OrderNo
  ,@OrderLine
  ,@SupplierID
  ,@BuyerIDinPO
  ,@IndenterName
  ,@IndenterEMail
  ,@BuyerName
  ,@BuyerEMail
  ,@BuyerIDinPOName
  ,@BuyerIDinPOEMail
  ,@SupplierName
  ,@DocumentTitle
  )
  SET @Return_DCRNo = @DCRNo
  SET @Return_DocumentID = @DocumentID
  SET @Return_RevisionNo = @RevisionNo
GO
