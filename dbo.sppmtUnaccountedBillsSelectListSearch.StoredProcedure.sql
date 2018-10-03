USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtUnaccountedBillsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @PostedInBaaN Bit,
  @CQReceived Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo)
  SELECT [PMT_IRDocs].[IRNo] FROM [PMT_IRDocs]
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor2]
    ON [PMT_IRDocs].[VendorID] = [PMT_Vendor2].[VendorID]
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]
    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]
 WHERE  
      [PMT_IRDocs].[PostedInBaaN] = @PostedInBaaN
  AND [PMT_IRDocs].[CQReceived] = @CQReceived
   AND ( 
         STR(ISNULL([PMT_IRDocs].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[VendorBillNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[PassedDistance], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[PassedHours], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[PassedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[CQRNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor2].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_BookingStatus3].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'IRNo' THEN [PMT_IRDocs].[IRNo] END,
     CASE @orderBy WHEN 'IRNo DESC' THEN [PMT_IRDocs].[IRNo] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [PMT_IRDocs].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [PMT_IRDocs].[VendorID] END DESC,
     CASE @orderBy WHEN 'VendorBillNo' THEN [PMT_IRDocs].[VendorBillNo] END,
     CASE @orderBy WHEN 'VendorBillNo DESC' THEN [PMT_IRDocs].[VendorBillNo] END DESC,
     CASE @orderBy WHEN 'VendorBillDate' THEN [PMT_IRDocs].[VendorBillDate] END,
     CASE @orderBy WHEN 'VendorBillDate DESC' THEN [PMT_IRDocs].[VendorBillDate] END DESC,
     CASE @orderBy WHEN 'PassedDistance' THEN [PMT_IRDocs].[PassedDistance] END,
     CASE @orderBy WHEN 'PassedDistance DESC' THEN [PMT_IRDocs].[PassedDistance] END DESC,
     CASE @orderBy WHEN 'PassedHours' THEN [PMT_IRDocs].[PassedHours] END,
     CASE @orderBy WHEN 'PassedHours DESC' THEN [PMT_IRDocs].[PassedHours] END DESC,
     CASE @orderBy WHEN 'PassedAmount' THEN [PMT_IRDocs].[PassedAmount] END,
     CASE @orderBy WHEN 'PassedAmount DESC' THEN [PMT_IRDocs].[PassedAmount] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [PMT_IRDocs].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [PMT_IRDocs].[Remarks] END DESC,
     CASE @orderBy WHEN 'PostedInBaaN' THEN [PMT_IRDocs].[PostedInBaaN] END,
     CASE @orderBy WHEN 'PostedInBaaN DESC' THEN [PMT_IRDocs].[PostedInBaaN] END DESC,
     CASE @orderBy WHEN 'PostedOn' THEN [PMT_IRDocs].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [PMT_IRDocs].[PostedOn] END DESC,
     CASE @orderBy WHEN 'CQReceived' THEN [PMT_IRDocs].[CQReceived] END,
     CASE @orderBy WHEN 'CQReceived DESC' THEN [PMT_IRDocs].[CQReceived] END DESC,
     CASE @orderBy WHEN 'CQRNo' THEN [PMT_IRDocs].[CQRNo] END,
     CASE @orderBy WHEN 'CQRNo DESC' THEN [PMT_IRDocs].[CQRNo] END DESC,
     CASE @orderBy WHEN 'CQRDt' THEN [PMT_IRDocs].[CQRDt] END,
     CASE @orderBy WHEN 'CQRDt DESC' THEN [PMT_IRDocs].[CQRDt] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [PMT_IRDocs].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PMT_IRDocs].[StatusID] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor2_VendorID' THEN [PMT_Vendor2].[VendorID] END,
     CASE @orderBy WHEN 'PMT_Vendor2_VendorID DESC' THEN [PMT_Vendor2].[VendorID] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor2_Description' THEN [PMT_Vendor2].[Description] END,
     CASE @orderBy WHEN 'PMT_Vendor2_Description DESC' THEN [PMT_Vendor2].[Description] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor2_Active' THEN [PMT_Vendor2].[Active] END,
     CASE @orderBy WHEN 'PMT_Vendor2_Active DESC' THEN [PMT_Vendor2].[Active] END DESC,
     CASE @orderBy WHEN 'PMT_BookingStatus3_StatusID' THEN [PMT_BookingStatus3].[StatusID] END,
     CASE @orderBy WHEN 'PMT_BookingStatus3_StatusID DESC' THEN [PMT_BookingStatus3].[StatusID] END DESC,
     CASE @orderBy WHEN 'PMT_BookingStatus3_Description' THEN [PMT_BookingStatus3].[Description] END,
     CASE @orderBy WHEN 'PMT_BookingStatus3_Description DESC' THEN [PMT_BookingStatus3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMT_IRDocs].[IRNo],
		[PMT_IRDocs].[VendorID],
		[PMT_IRDocs].[VendorBillNo],
		[PMT_IRDocs].[VendorBillDate],
		[PMT_IRDocs].[PassedDistance],
		[PMT_IRDocs].[PassedHours],
		[PMT_IRDocs].[PassedAmount],
		[PMT_IRDocs].[Remarks],
		[PMT_IRDocs].[PostedInBaaN],
		[PMT_IRDocs].[PostedOn],
		[PMT_IRDocs].[CQReceived],
		[PMT_IRDocs].[CQRNo],
		[PMT_IRDocs].[CQRDt],
		[PMT_IRDocs].[StatusID],
		[PMT_Vendor2].[VendorID] AS PMT_Vendor2_VendorID,
		[PMT_Vendor2].[Description] AS PMT_Vendor2_Description,
		[PMT_Vendor2].[Active] AS PMT_Vendor2_Active,
		[PMT_BookingStatus3].[StatusID] AS PMT_BookingStatus3_StatusID,
		[PMT_BookingStatus3].[Description] AS PMT_BookingStatus3_Description 
  FROM [PMT_IRDocs] 
    	INNER JOIN #PageIndex
          ON [PMT_IRDocs].[IRNo] = #PageIndex.IRNo
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor2]
    ON [PMT_IRDocs].[VendorID] = [PMT_Vendor2].[VendorID]
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]
    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
