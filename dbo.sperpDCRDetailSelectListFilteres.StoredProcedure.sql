USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sperpDCRDetailSelectListFilteres]
  @Filter_DCRNo NVarChar(10),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,DCRNo NVarChar(10) NOT NULL
 ,DocumentID NVarChar(30) NOT NULL
 ,RevisionNo NVarChar(5) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DCRNo'
  SET @LGSQL = @LGSQL + ', DocumentID'
  SET @LGSQL = @LGSQL + ', RevisionNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_DCRDetail].[DCRNo]'
  SET @LGSQL = @LGSQL + ', [ERP_DCRDetail].[DocumentID]'
  SET @LGSQL = @LGSQL + ', [ERP_DCRDetail].[RevisionNo]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_DCRDetail] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ERP_DCRHeader] AS [ERP_DCRHeader1]'
  SET @LGSQL = @LGSQL + '    ON [ERP_DCRDetail].[DCRNo] = [ERP_DCRHeader1].[DCRNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DCRNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ERP_DCRDetail].[DCRNo] = ''' + @Filter_DCRNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DCRNo' THEN '[ERP_DCRDetail].[DCRNo]'
                        WHEN 'DCRNo DESC' THEN '[ERP_DCRDetail].[DCRNo] DESC'
                        WHEN 'DocumentID' THEN '[ERP_DCRDetail].[DocumentID]'
                        WHEN 'DocumentID DESC' THEN '[ERP_DCRDetail].[DocumentID] DESC'
                        WHEN 'RevisionNo' THEN '[ERP_DCRDetail].[RevisionNo]'
                        WHEN 'RevisionNo DESC' THEN '[ERP_DCRDetail].[RevisionNo] DESC'
                        WHEN 'IndentNo' THEN '[ERP_DCRDetail].[IndentNo]'
                        WHEN 'IndentNo DESC' THEN '[ERP_DCRDetail].[IndentNo] DESC'
                        WHEN 'IndentLine' THEN '[ERP_DCRDetail].[IndentLine]'
                        WHEN 'IndentLine DESC' THEN '[ERP_DCRDetail].[IndentLine] DESC'
                        WHEN 'LotItem' THEN '[ERP_DCRDetail].[LotItem]'
                        WHEN 'LotItem DESC' THEN '[ERP_DCRDetail].[LotItem] DESC'
                        WHEN 'ItemDescription' THEN '[ERP_DCRDetail].[ItemDescription]'
                        WHEN 'ItemDescription DESC' THEN '[ERP_DCRDetail].[ItemDescription] DESC'
                        WHEN 'IndenterID' THEN '[ERP_DCRDetail].[IndenterID]'
                        WHEN 'IndenterID DESC' THEN '[ERP_DCRDetail].[IndenterID] DESC'
                        WHEN 'BuyerID' THEN '[ERP_DCRDetail].[BuyerID]'
                        WHEN 'BuyerID DESC' THEN '[ERP_DCRDetail].[BuyerID] DESC'
                        WHEN 'OrderNo' THEN '[ERP_DCRDetail].[OrderNo]'
                        WHEN 'OrderNo DESC' THEN '[ERP_DCRDetail].[OrderNo] DESC'
                        WHEN 'OrderLine' THEN '[ERP_DCRDetail].[OrderLine]'
                        WHEN 'OrderLine DESC' THEN '[ERP_DCRDetail].[OrderLine] DESC'
                        WHEN 'SupplierID' THEN '[ERP_DCRDetail].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ERP_DCRDetail].[SupplierID] DESC'
                        WHEN 'BuyerIDinPO' THEN '[ERP_DCRDetail].[BuyerIDinPO]'
                        WHEN 'BuyerIDinPO DESC' THEN '[ERP_DCRDetail].[BuyerIDinPO] DESC'
                        WHEN 'IndenterName' THEN '[ERP_DCRDetail].[IndenterName]'
                        WHEN 'IndenterName DESC' THEN '[ERP_DCRDetail].[IndenterName] DESC'
                        WHEN 'IndenterEMail' THEN '[ERP_DCRDetail].[IndenterEMail]'
                        WHEN 'IndenterEMail DESC' THEN '[ERP_DCRDetail].[IndenterEMail] DESC'
                        WHEN 'BuyerName' THEN '[ERP_DCRDetail].[BuyerName]'
                        WHEN 'BuyerName DESC' THEN '[ERP_DCRDetail].[BuyerName] DESC'
                        WHEN 'BuyerEMail' THEN '[ERP_DCRDetail].[BuyerEMail]'
                        WHEN 'BuyerEMail DESC' THEN '[ERP_DCRDetail].[BuyerEMail] DESC'
                        WHEN 'BuyerIDinPOName' THEN '[ERP_DCRDetail].[BuyerIDinPOName]'
                        WHEN 'BuyerIDinPOName DESC' THEN '[ERP_DCRDetail].[BuyerIDinPOName] DESC'
                        WHEN 'BuyerIDinPOEMail' THEN '[ERP_DCRDetail].[BuyerIDinPOEMail]'
                        WHEN 'BuyerIDinPOEMail DESC' THEN '[ERP_DCRDetail].[BuyerIDinPOEMail] DESC'
                        WHEN 'SupplierName' THEN '[ERP_DCRDetail].[SupplierName]'
                        WHEN 'SupplierName DESC' THEN '[ERP_DCRDetail].[SupplierName] DESC'
                        WHEN 'DocumentTitle' THEN '[ERP_DCRDetail].[DocumentTitle]'
                        WHEN 'DocumentTitle DESC' THEN '[ERP_DCRDetail].[DocumentTitle] DESC'
                        WHEN 'ERP_DCRHeader1_DCRDescription' THEN '[ERP_DCRHeader1].[DCRDescription]'
                        WHEN 'ERP_DCRHeader1_DCRDescription DESC' THEN '[ERP_DCRHeader1].[DCRDescription] DESC'
                        ELSE '[ERP_DCRDetail].[DCRNo],[ERP_DCRDetail].[DocumentID],[ERP_DCRDetail].[RevisionNo]'
                    END
  EXEC (@LGSQL)

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
