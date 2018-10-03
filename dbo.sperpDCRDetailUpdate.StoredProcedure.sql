USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRDetailUpdate]
  @Original_DCRNo NVarChar(10), 
  @Original_DocumentID NVarChar(30), 
  @Original_RevisionNo NVarChar(5), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_DCRDetail] SET 
   [DCRNo] = @DCRNo
  ,[DocumentID] = @DocumentID
  ,[RevisionNo] = @RevisionNo
  ,[IndentNo] = @IndentNo
  ,[IndentLine] = @IndentLine
  ,[LotItem] = @LotItem
  ,[ItemDescription] = @ItemDescription
  ,[IndenterID] = @IndenterID
  ,[BuyerID] = @BuyerID
  ,[OrderNo] = @OrderNo
  ,[OrderLine] = @OrderLine
  ,[SupplierID] = @SupplierID
  ,[BuyerIDinPO] = @BuyerIDinPO
  ,[IndenterName] = @IndenterName
  ,[IndenterEMail] = @IndenterEMail
  ,[BuyerName] = @BuyerName
  ,[BuyerEMail] = @BuyerEMail
  ,[BuyerIDinPOName] = @BuyerIDinPOName
  ,[BuyerIDinPOEMail] = @BuyerIDinPOEMail
  ,[SupplierName] = @SupplierName
  ,[DocumentTitle] = @DocumentTitle
  WHERE
  [DCRNo] = @Original_DCRNo
  AND [DocumentID] = @Original_DocumentID
  AND [RevisionNo] = @Original_RevisionNo
  SET @RowCount = @@RowCount
GO
