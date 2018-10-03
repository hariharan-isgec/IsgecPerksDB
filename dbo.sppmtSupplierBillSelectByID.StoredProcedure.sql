USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtSupplierBillSelectByID]
  @IRNo Int 
  AS
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
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMT_IRDocs].[PostedBy] = [HRM_Employees1].[CardNo]
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor2]
    ON [PMT_IRDocs].[VendorID] = [PMT_Vendor2].[VendorID]
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]
    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]
  WHERE
  [PMT_IRDocs].[IRNo] = @IRNo
GO
