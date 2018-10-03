USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtSupplierBillSelectListSearch]
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
 ,IRNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo)
  SELECT [PMT_IRDocs].[IRNo] FROM [PMT_IRDocs]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMT_IRDocs].[PostedBy] = [HRM_Employees1].[CardNo]
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor2]
    ON [PMT_IRDocs].[VendorID] = [PMT_Vendor2].[VendorID]
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]
    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]
 WHERE  
   ( 
         STR(ISNULL([PMT_IRDocs].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[VendorBillNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[BillDistance], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[BillHours], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[BillAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[PassedDistance], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[PassedHours], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[PassedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[PostedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[BatchNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[VoucherNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_IRDocs].[VoucherLineNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_IRDocs].[CQRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor2].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_BookingStatus3].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'IRNo' THEN [PMT_IRDocs].[IRNo] END,
     CASE @orderBy WHEN 'IRNo DESC' THEN [PMT_IRDocs].[IRNo] END DESC,
     CASE @orderBy WHEN 'ReceivedOn' THEN [PMT_IRDocs].[ReceivedOn] END,
     CASE @orderBy WHEN 'ReceivedOn DESC' THEN [PMT_IRDocs].[ReceivedOn] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [PMT_IRDocs].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [PMT_IRDocs].[VendorID] END DESC,
     CASE @orderBy WHEN 'VendorBillNo' THEN [PMT_IRDocs].[VendorBillNo] END,
     CASE @orderBy WHEN 'VendorBillNo DESC' THEN [PMT_IRDocs].[VendorBillNo] END DESC,
     CASE @orderBy WHEN 'VendorBillDate' THEN [PMT_IRDocs].[VendorBillDate] END,
     CASE @orderBy WHEN 'VendorBillDate DESC' THEN [PMT_IRDocs].[VendorBillDate] END DESC,
     CASE @orderBy WHEN 'BillDistance' THEN [PMT_IRDocs].[BillDistance] END,
     CASE @orderBy WHEN 'BillDistance DESC' THEN [PMT_IRDocs].[BillDistance] END DESC,
     CASE @orderBy WHEN 'BillHours' THEN [PMT_IRDocs].[BillHours] END,
     CASE @orderBy WHEN 'BillHours DESC' THEN [PMT_IRDocs].[BillHours] END DESC,
     CASE @orderBy WHEN 'BillAmount' THEN [PMT_IRDocs].[BillAmount] END,
     CASE @orderBy WHEN 'BillAmount DESC' THEN [PMT_IRDocs].[BillAmount] END DESC,
     CASE @orderBy WHEN 'PassedDistance' THEN [PMT_IRDocs].[PassedDistance] END,
     CASE @orderBy WHEN 'PassedDistance DESC' THEN [PMT_IRDocs].[PassedDistance] END DESC,
     CASE @orderBy WHEN 'PassedHours' THEN [PMT_IRDocs].[PassedHours] END,
     CASE @orderBy WHEN 'PassedHours DESC' THEN [PMT_IRDocs].[PassedHours] END DESC,
     CASE @orderBy WHEN 'PassedAmount' THEN [PMT_IRDocs].[PassedAmount] END,
     CASE @orderBy WHEN 'PassedAmount DESC' THEN [PMT_IRDocs].[PassedAmount] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [PMT_IRDocs].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [PMT_IRDocs].[Remarks] END DESC,
     CASE @orderBy WHEN 'BillCorrected' THEN [PMT_IRDocs].[BillCorrected] END,
     CASE @orderBy WHEN 'BillCorrected DESC' THEN [PMT_IRDocs].[BillCorrected] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [PMT_IRDocs].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PMT_IRDocs].[StatusID] END DESC,
     CASE @orderBy WHEN 'PostedInBaaN' THEN [PMT_IRDocs].[PostedInBaaN] END,
     CASE @orderBy WHEN 'PostedInBaaN DESC' THEN [PMT_IRDocs].[PostedInBaaN] END DESC,
     CASE @orderBy WHEN 'PostedOn' THEN [PMT_IRDocs].[PostedOn] END,
     CASE @orderBy WHEN 'PostedOn DESC' THEN [PMT_IRDocs].[PostedOn] END DESC,
     CASE @orderBy WHEN 'PostedBy' THEN [PMT_IRDocs].[PostedBy] END,
     CASE @orderBy WHEN 'PostedBy DESC' THEN [PMT_IRDocs].[PostedBy] END DESC,
     CASE @orderBy WHEN 'BatchNo' THEN [PMT_IRDocs].[BatchNo] END,
     CASE @orderBy WHEN 'BatchNo DESC' THEN [PMT_IRDocs].[BatchNo] END DESC,
     CASE @orderBy WHEN 'VoucherNo' THEN [PMT_IRDocs].[VoucherNo] END,
     CASE @orderBy WHEN 'VoucherNo DESC' THEN [PMT_IRDocs].[VoucherNo] END DESC,
     CASE @orderBy WHEN 'VoucherLineNo' THEN [PMT_IRDocs].[VoucherLineNo] END,
     CASE @orderBy WHEN 'VoucherLineNo DESC' THEN [PMT_IRDocs].[VoucherLineNo] END DESC,
     CASE @orderBy WHEN 'CQReceived' THEN [PMT_IRDocs].[CQReceived] END,
     CASE @orderBy WHEN 'CQReceived DESC' THEN [PMT_IRDocs].[CQReceived] END DESC,
     CASE @orderBy WHEN 'CQRNo' THEN [PMT_IRDocs].[CQRNo] END,
     CASE @orderBy WHEN 'CQRNo DESC' THEN [PMT_IRDocs].[CQRNo] END DESC,
     CASE @orderBy WHEN 'CQRDt' THEN [PMT_IRDocs].[CQRDt] END,
     CASE @orderBy WHEN 'CQRDt DESC' THEN [PMT_IRDocs].[CQRDt] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID' THEN [HRM_Employees1].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID DESC' THEN [HRM_Employees1].[C_OfficeID] END DESC,
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
		[PMT_IRDocs].[ReceivedOn],
		[PMT_IRDocs].[VendorID],
		[PMT_IRDocs].[VendorBillNo],
		[PMT_IRDocs].[VendorBillDate],
		[PMT_IRDocs].[BillDistance],
		[PMT_IRDocs].[BillHours],
		[PMT_IRDocs].[BillAmount],
		[PMT_IRDocs].[PassedDistance],
		[PMT_IRDocs].[PassedHours],
		[PMT_IRDocs].[PassedAmount],
		[PMT_IRDocs].[Remarks],
		[PMT_IRDocs].[BillCorrected],
		[PMT_IRDocs].[StatusID],
		[PMT_IRDocs].[PostedInBaaN],
		[PMT_IRDocs].[PostedOn],
		[PMT_IRDocs].[PostedBy],
		[PMT_IRDocs].[BatchNo],
		[PMT_IRDocs].[VoucherNo],
		[PMT_IRDocs].[VoucherLineNo],
		[PMT_IRDocs].[CQReceived],
		[PMT_IRDocs].[CQRNo],
		[PMT_IRDocs].[CQRDt],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[PMT_Vendor2].[VendorID] AS PMT_Vendor2_VendorID,
		[PMT_Vendor2].[Description] AS PMT_Vendor2_Description,
		[PMT_Vendor2].[Active] AS PMT_Vendor2_Active,
		[PMT_BookingStatus3].[StatusID] AS PMT_BookingStatus3_StatusID,
		[PMT_BookingStatus3].[Description] AS PMT_BookingStatus3_Description 
  FROM [PMT_IRDocs] 
    	INNER JOIN #PageIndex
          ON [PMT_IRDocs].[IRNo] = #PageIndex.IRNo
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMT_IRDocs].[PostedBy] = [HRM_Employees1].[CardNo]
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
