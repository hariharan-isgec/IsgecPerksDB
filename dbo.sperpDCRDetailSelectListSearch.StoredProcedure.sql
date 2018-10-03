USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRDetailSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,DCRNo NVarChar(10) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(5) NOT NULL
  )
  INSERT INTO #PageIndex (DCRNo, DocumentID, RevisionNo)
  SELECT [ERP_DCRDetail].[DCRNo], [ERP_DCRDetail].[DocumentID], [ERP_DCRDetail].[RevisionNo] FROM [ERP_DCRDetail]
  INNER JOIN [ERP_DCRHeader] AS [ERP_DCRHeader1]
    ON [ERP_DCRDetail].[DCRNo] = [ERP_DCRHeader1].[DCRNo]
 WHERE  
   ( 
         LOWER(ISNULL([ERP_DCRDetail].[DCRNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[DocumentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[RevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[IndentNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[IndentLine],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[LotItem],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[ItemDescription],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[IndenterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[BuyerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[OrderNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[OrderLine],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[BuyerIDinPO],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[IndenterName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[IndenterEMail],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[BuyerName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[BuyerEMail],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[BuyerIDinPOName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[BuyerIDinPOEMail],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[SupplierName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_DCRDetail].[DocumentTitle],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DCRNo' THEN [ERP_DCRDetail].[DCRNo] END,
     CASE @OrderBy WHEN 'DCRNo DESC' THEN [ERP_DCRDetail].[DCRNo] END DESC,
     CASE @OrderBy WHEN 'DocumentID' THEN [ERP_DCRDetail].[DocumentID] END,
     CASE @OrderBy WHEN 'DocumentID DESC' THEN [ERP_DCRDetail].[DocumentID] END DESC,
     CASE @OrderBy WHEN 'RevisionNo' THEN [ERP_DCRDetail].[RevisionNo] END,
     CASE @OrderBy WHEN 'RevisionNo DESC' THEN [ERP_DCRDetail].[RevisionNo] END DESC,
     CASE @OrderBy WHEN 'IndentNo' THEN [ERP_DCRDetail].[IndentNo] END,
     CASE @OrderBy WHEN 'IndentNo DESC' THEN [ERP_DCRDetail].[IndentNo] END DESC,
     CASE @OrderBy WHEN 'IndentLine' THEN [ERP_DCRDetail].[IndentLine] END,
     CASE @OrderBy WHEN 'IndentLine DESC' THEN [ERP_DCRDetail].[IndentLine] END DESC,
     CASE @OrderBy WHEN 'LotItem' THEN [ERP_DCRDetail].[LotItem] END,
     CASE @OrderBy WHEN 'LotItem DESC' THEN [ERP_DCRDetail].[LotItem] END DESC,
     CASE @OrderBy WHEN 'ItemDescription' THEN [ERP_DCRDetail].[ItemDescription] END,
     CASE @OrderBy WHEN 'ItemDescription DESC' THEN [ERP_DCRDetail].[ItemDescription] END DESC,
     CASE @OrderBy WHEN 'IndenterID' THEN [ERP_DCRDetail].[IndenterID] END,
     CASE @OrderBy WHEN 'IndenterID DESC' THEN [ERP_DCRDetail].[IndenterID] END DESC,
     CASE @OrderBy WHEN 'BuyerID' THEN [ERP_DCRDetail].[BuyerID] END,
     CASE @OrderBy WHEN 'BuyerID DESC' THEN [ERP_DCRDetail].[BuyerID] END DESC,
     CASE @OrderBy WHEN 'OrderNo' THEN [ERP_DCRDetail].[OrderNo] END,
     CASE @OrderBy WHEN 'OrderNo DESC' THEN [ERP_DCRDetail].[OrderNo] END DESC,
     CASE @OrderBy WHEN 'OrderLine' THEN [ERP_DCRDetail].[OrderLine] END,
     CASE @OrderBy WHEN 'OrderLine DESC' THEN [ERP_DCRDetail].[OrderLine] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [ERP_DCRDetail].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [ERP_DCRDetail].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'BuyerIDinPO' THEN [ERP_DCRDetail].[BuyerIDinPO] END,
     CASE @OrderBy WHEN 'BuyerIDinPO DESC' THEN [ERP_DCRDetail].[BuyerIDinPO] END DESC,
     CASE @OrderBy WHEN 'IndenterName' THEN [ERP_DCRDetail].[IndenterName] END,
     CASE @OrderBy WHEN 'IndenterName DESC' THEN [ERP_DCRDetail].[IndenterName] END DESC,
     CASE @OrderBy WHEN 'IndenterEMail' THEN [ERP_DCRDetail].[IndenterEMail] END,
     CASE @OrderBy WHEN 'IndenterEMail DESC' THEN [ERP_DCRDetail].[IndenterEMail] END DESC,
     CASE @OrderBy WHEN 'BuyerName' THEN [ERP_DCRDetail].[BuyerName] END,
     CASE @OrderBy WHEN 'BuyerName DESC' THEN [ERP_DCRDetail].[BuyerName] END DESC,
     CASE @OrderBy WHEN 'BuyerEMail' THEN [ERP_DCRDetail].[BuyerEMail] END,
     CASE @OrderBy WHEN 'BuyerEMail DESC' THEN [ERP_DCRDetail].[BuyerEMail] END DESC,
     CASE @OrderBy WHEN 'BuyerIDinPOName' THEN [ERP_DCRDetail].[BuyerIDinPOName] END,
     CASE @OrderBy WHEN 'BuyerIDinPOName DESC' THEN [ERP_DCRDetail].[BuyerIDinPOName] END DESC,
     CASE @OrderBy WHEN 'BuyerIDinPOEMail' THEN [ERP_DCRDetail].[BuyerIDinPOEMail] END,
     CASE @OrderBy WHEN 'BuyerIDinPOEMail DESC' THEN [ERP_DCRDetail].[BuyerIDinPOEMail] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [ERP_DCRDetail].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [ERP_DCRDetail].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'DocumentTitle' THEN [ERP_DCRDetail].[DocumentTitle] END,
     CASE @OrderBy WHEN 'DocumentTitle DESC' THEN [ERP_DCRDetail].[DocumentTitle] END DESC,
     CASE @OrderBy WHEN 'ERP_DCRHeader1_DCRDescription' THEN [ERP_DCRHeader1].[DCRDescription] END,
     CASE @OrderBy WHEN 'ERP_DCRHeader1_DCRDescription DESC' THEN [ERP_DCRHeader1].[DCRDescription] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [ERP_DCRDetail].[DCRNo] = #PageIndex.DCRNo
          AND [ERP_DCRDetail].[DocumentID] = #PageIndex.DocumentID
          AND [ERP_DCRDetail].[RevisionNo] = #PageIndex.RevisionNo
  INNER JOIN [ERP_DCRHeader] AS [ERP_DCRHeader1]
    ON [ERP_DCRDetail].[DCRNo] = [ERP_DCRHeader1].[DCRNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
