USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtChequeReceiptsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CQRNo Int NOT NULL
  )
  INSERT INTO #PageIndex (CQRNo)
  SELECT [PMT_CQReceipts].[CQRNo] FROM [PMT_CQReceipts]
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus2]
    ON [PMT_CQReceipts].[StatusID] = [PMT_BookingStatus2].[StatusID]
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor1]
    ON [PMT_CQReceipts].[VendorID] = [PMT_Vendor1].[VendorID]
 WHERE  
   ( 
         STR(ISNULL([PMT_CQReceipts].[CQRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_CQReceipts].[CQNumber],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_CQReceipts].[CQAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_CQReceipts].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_CQReceipts].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_CQReceipts].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_BookingStatus2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor1].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CQRNo' THEN [PMT_CQReceipts].[CQRNo] END,
     CASE @orderBy WHEN 'CQRNo DESC' THEN [PMT_CQReceipts].[CQRNo] END DESC,
     CASE @orderBy WHEN 'CQNumber' THEN [PMT_CQReceipts].[CQNumber] END,
     CASE @orderBy WHEN 'CQNumber DESC' THEN [PMT_CQReceipts].[CQNumber] END DESC,
     CASE @orderBy WHEN 'CQDate' THEN [PMT_CQReceipts].[CQDate] END,
     CASE @orderBy WHEN 'CQDate DESC' THEN [PMT_CQReceipts].[CQDate] END DESC,
     CASE @orderBy WHEN 'CQAmount' THEN [PMT_CQReceipts].[CQAmount] END,
     CASE @orderBy WHEN 'CQAmount DESC' THEN [PMT_CQReceipts].[CQAmount] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [PMT_CQReceipts].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [PMT_CQReceipts].[VendorID] END DESC,
     CASE @orderBy WHEN 'CQRDt' THEN [PMT_CQReceipts].[CQRDt] END,
     CASE @orderBy WHEN 'CQRDt DESC' THEN [PMT_CQReceipts].[CQRDt] END DESC,
     CASE @orderBy WHEN 'Delivered' THEN [PMT_CQReceipts].[Delivered] END,
     CASE @orderBy WHEN 'Delivered DESC' THEN [PMT_CQReceipts].[Delivered] END DESC,
     CASE @orderBy WHEN 'DeliveredOn' THEN [PMT_CQReceipts].[DeliveredOn] END,
     CASE @orderBy WHEN 'DeliveredOn DESC' THEN [PMT_CQReceipts].[DeliveredOn] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [PMT_CQReceipts].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [PMT_CQReceipts].[Remarks] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [PMT_CQReceipts].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PMT_CQReceipts].[StatusID] END DESC,
     CASE @orderBy WHEN 'PMT_BookingStatus2_StatusID' THEN [PMT_BookingStatus2].[StatusID] END,
     CASE @orderBy WHEN 'PMT_BookingStatus2_StatusID DESC' THEN [PMT_BookingStatus2].[StatusID] END DESC,
     CASE @orderBy WHEN 'PMT_BookingStatus2_Description' THEN [PMT_BookingStatus2].[Description] END,
     CASE @orderBy WHEN 'PMT_BookingStatus2_Description DESC' THEN [PMT_BookingStatus2].[Description] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor1_VendorID' THEN [PMT_Vendor1].[VendorID] END,
     CASE @orderBy WHEN 'PMT_Vendor1_VendorID DESC' THEN [PMT_Vendor1].[VendorID] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor1_Description' THEN [PMT_Vendor1].[Description] END,
     CASE @orderBy WHEN 'PMT_Vendor1_Description DESC' THEN [PMT_Vendor1].[Description] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor1_Active' THEN [PMT_Vendor1].[Active] END,
     CASE @orderBy WHEN 'PMT_Vendor1_Active DESC' THEN [PMT_Vendor1].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMT_CQReceipts].[CQRNo],
		[PMT_CQReceipts].[CQNumber],
		[PMT_CQReceipts].[CQDate],
		[PMT_CQReceipts].[CQAmount],
		[PMT_CQReceipts].[VendorID],
		[PMT_CQReceipts].[CQRDt],
		[PMT_CQReceipts].[Delivered],
		[PMT_CQReceipts].[DeliveredOn],
		[PMT_CQReceipts].[Remarks],
		[PMT_CQReceipts].[StatusID],
		[PMT_BookingStatus2].[StatusID] AS PMT_BookingStatus2_StatusID,
		[PMT_BookingStatus2].[Description] AS PMT_BookingStatus2_Description,
		[PMT_Vendor1].[VendorID] AS PMT_Vendor1_VendorID,
		[PMT_Vendor1].[Description] AS PMT_Vendor1_Description,
		[PMT_Vendor1].[Active] AS PMT_Vendor1_Active 
  FROM [PMT_CQReceipts] 
    	INNER JOIN #PageIndex
          ON [PMT_CQReceipts].[CQRNo] = #PageIndex.CQRNo
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus2]
    ON [PMT_CQReceipts].[StatusID] = [PMT_BookingStatus2].[StatusID]
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor1]
    ON [PMT_CQReceipts].[VendorID] = [PMT_Vendor1].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
