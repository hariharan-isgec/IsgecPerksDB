USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtSupplierBillSelectListFilteres]
  @Filter_VendorID NVarChar(6),
  @Filter_StatusID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMT_IRDocs].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [PMT_IRDocs] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PMT_IRDocs].[PostedBy] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMT_Vendor] AS [PMT_Vendor2]'
  SET @LGSQL = @LGSQL + '    ON [PMT_IRDocs].[VendorID] = [PMT_Vendor2].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]'
  SET @LGSQL = @LGSQL + '    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [PMT_IRDocs].[VendorID] = ''' + @Filter_VendorID + ''''
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PMT_IRDocs].[StatusID] = ' + STR(@Filter_StatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[PMT_IRDocs].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[PMT_IRDocs].[IRNo] DESC'
                        WHEN 'ReceivedOn' THEN '[PMT_IRDocs].[ReceivedOn]'
                        WHEN 'ReceivedOn DESC' THEN '[PMT_IRDocs].[ReceivedOn] DESC'
                        WHEN 'VendorID' THEN '[PMT_IRDocs].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[PMT_IRDocs].[VendorID] DESC'
                        WHEN 'VendorBillNo' THEN '[PMT_IRDocs].[VendorBillNo]'
                        WHEN 'VendorBillNo DESC' THEN '[PMT_IRDocs].[VendorBillNo] DESC'
                        WHEN 'VendorBillDate' THEN '[PMT_IRDocs].[VendorBillDate]'
                        WHEN 'VendorBillDate DESC' THEN '[PMT_IRDocs].[VendorBillDate] DESC'
                        WHEN 'BillDistance' THEN '[PMT_IRDocs].[BillDistance]'
                        WHEN 'BillDistance DESC' THEN '[PMT_IRDocs].[BillDistance] DESC'
                        WHEN 'BillHours' THEN '[PMT_IRDocs].[BillHours]'
                        WHEN 'BillHours DESC' THEN '[PMT_IRDocs].[BillHours] DESC'
                        WHEN 'BillAmount' THEN '[PMT_IRDocs].[BillAmount]'
                        WHEN 'BillAmount DESC' THEN '[PMT_IRDocs].[BillAmount] DESC'
                        WHEN 'PassedDistance' THEN '[PMT_IRDocs].[PassedDistance]'
                        WHEN 'PassedDistance DESC' THEN '[PMT_IRDocs].[PassedDistance] DESC'
                        WHEN 'PassedHours' THEN '[PMT_IRDocs].[PassedHours]'
                        WHEN 'PassedHours DESC' THEN '[PMT_IRDocs].[PassedHours] DESC'
                        WHEN 'PassedAmount' THEN '[PMT_IRDocs].[PassedAmount]'
                        WHEN 'PassedAmount DESC' THEN '[PMT_IRDocs].[PassedAmount] DESC'
                        WHEN 'Remarks' THEN '[PMT_IRDocs].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[PMT_IRDocs].[Remarks] DESC'
                        WHEN 'BillCorrected' THEN '[PMT_IRDocs].[BillCorrected]'
                        WHEN 'BillCorrected DESC' THEN '[PMT_IRDocs].[BillCorrected] DESC'
                        WHEN 'StatusID' THEN '[PMT_IRDocs].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PMT_IRDocs].[StatusID] DESC'
                        WHEN 'PostedInBaaN' THEN '[PMT_IRDocs].[PostedInBaaN]'
                        WHEN 'PostedInBaaN DESC' THEN '[PMT_IRDocs].[PostedInBaaN] DESC'
                        WHEN 'PostedOn' THEN '[PMT_IRDocs].[PostedOn]'
                        WHEN 'PostedOn DESC' THEN '[PMT_IRDocs].[PostedOn] DESC'
                        WHEN 'PostedBy' THEN '[PMT_IRDocs].[PostedBy]'
                        WHEN 'PostedBy DESC' THEN '[PMT_IRDocs].[PostedBy] DESC'
                        WHEN 'BatchNo' THEN '[PMT_IRDocs].[BatchNo]'
                        WHEN 'BatchNo DESC' THEN '[PMT_IRDocs].[BatchNo] DESC'
                        WHEN 'VoucherNo' THEN '[PMT_IRDocs].[VoucherNo]'
                        WHEN 'VoucherNo DESC' THEN '[PMT_IRDocs].[VoucherNo] DESC'
                        WHEN 'VoucherLineNo' THEN '[PMT_IRDocs].[VoucherLineNo]'
                        WHEN 'VoucherLineNo DESC' THEN '[PMT_IRDocs].[VoucherLineNo] DESC'
                        WHEN 'CQReceived' THEN '[PMT_IRDocs].[CQReceived]'
                        WHEN 'CQReceived DESC' THEN '[PMT_IRDocs].[CQReceived] DESC'
                        WHEN 'CQRNo' THEN '[PMT_IRDocs].[CQRNo]'
                        WHEN 'CQRNo DESC' THEN '[PMT_IRDocs].[CQRNo] DESC'
                        WHEN 'CQRDt' THEN '[PMT_IRDocs].[CQRDt]'
                        WHEN 'CQRDt DESC' THEN '[PMT_IRDocs].[CQRDt] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'PMT_Vendor2_VendorID' THEN '[PMT_Vendor2].[VendorID]'
                        WHEN 'PMT_Vendor2_VendorID DESC' THEN '[PMT_Vendor2].[VendorID] DESC'
                        WHEN 'PMT_Vendor2_Description' THEN '[PMT_Vendor2].[Description]'
                        WHEN 'PMT_Vendor2_Description DESC' THEN '[PMT_Vendor2].[Description] DESC'
                        WHEN 'PMT_Vendor2_Active' THEN '[PMT_Vendor2].[Active]'
                        WHEN 'PMT_Vendor2_Active DESC' THEN '[PMT_Vendor2].[Active] DESC'
                        WHEN 'PMT_BookingStatus3_StatusID' THEN '[PMT_BookingStatus3].[StatusID]'
                        WHEN 'PMT_BookingStatus3_StatusID DESC' THEN '[PMT_BookingStatus3].[StatusID] DESC'
                        WHEN 'PMT_BookingStatus3_Description' THEN '[PMT_BookingStatus3].[Description]'
                        WHEN 'PMT_BookingStatus3_Description DESC' THEN '[PMT_BookingStatus3].[Description] DESC'
                        ELSE '[PMT_IRDocs].[IRNo]'
                    END
  EXEC (@LGSQL)

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
