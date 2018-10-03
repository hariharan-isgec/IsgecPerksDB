USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtUnaccountedBillsSelectByID]
  @IRNo Int 
  AS
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
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor2]
    ON [PMT_IRDocs].[VendorID] = [PMT_Vendor2].[VendorID]
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus3]
    ON [PMT_IRDocs].[StatusID] = [PMT_BookingStatus3].[StatusID]
  WHERE
  [PMT_IRDocs].[IRNo] = @IRNo
GO
