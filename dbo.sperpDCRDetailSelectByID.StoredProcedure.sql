USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRDetailSelectByID]
  @LoginID NVarChar(8),
  @DCRNo NVarChar(10),
  @DocumentID NVarChar(30),
  @RevisionNo NVarChar(5) 
  AS
  SELECT
		[ERP_DCRDetail].[DCRNo] ,
		[ERP_DCRDetail].[DocumentID] ,
		[ERP_DCRDetail].[RevisionNo] ,
		[ERP_DCRDetail].[IndentNo] ,
		[ERP_DCRDetail].[IndentLine] ,
		[ERP_DCRDetail].[LotItem] ,
		[ERP_DCRDetail].[ItemDescription] ,
		[ERP_DCRDetail].[IndenterID] ,
		[ERP_DCRDetail].[BuyerID] ,
		[ERP_DCRDetail].[OrderNo] ,
		[ERP_DCRDetail].[OrderLine] ,
		[ERP_DCRDetail].[SupplierID] ,
		[ERP_DCRDetail].[BuyerIDinPO] ,
		[ERP_DCRDetail].[IndenterName] ,
		[ERP_DCRDetail].[IndenterEMail] ,
		[ERP_DCRDetail].[BuyerName] ,
		[ERP_DCRDetail].[BuyerEMail] ,
		[ERP_DCRDetail].[BuyerIDinPOName] ,
		[ERP_DCRDetail].[BuyerIDinPOEMail] ,
		[ERP_DCRDetail].[SupplierName] ,
		[ERP_DCRDetail].[DocumentTitle] ,
		[ERP_DCRHeader1].[DCRDescription] AS ERP_DCRHeader1_DCRDescription 
  FROM [ERP_DCRDetail] 
  INNER JOIN [ERP_DCRHeader] AS [ERP_DCRHeader1]
    ON [ERP_DCRDetail].[DCRNo] = [ERP_DCRHeader1].[DCRNo]
  WHERE
  [ERP_DCRDetail].[DCRNo] = @DCRNo
  AND [ERP_DCRDetail].[DocumentID] = @DocumentID
  AND [ERP_DCRDetail].[RevisionNo] = @RevisionNo
GO
