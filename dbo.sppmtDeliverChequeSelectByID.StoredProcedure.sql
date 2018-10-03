USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtDeliverChequeSelectByID]
  @CQRNo Int 
  AS
  SELECT
		[PMT_CQReceipts].[CQRNo],
		[PMT_CQReceipts].[CQRDt],
		[PMT_CQReceipts].[VendorID],
		[PMT_CQReceipts].[CQNumber],
		[PMT_CQReceipts].[CQAmount],
		[PMT_CQReceipts].[CQDate],
		[PMT_CQReceipts].[StatusID],
		[PMT_CQReceipts].[Remarks],
		[PMT_CQReceipts].[Delivered],
		[PMT_CQReceipts].[DeliveredOn],
		[PMT_BookingStatus2].[StatusID] AS PMT_BookingStatus2_StatusID,
		[PMT_BookingStatus2].[Description] AS PMT_BookingStatus2_Description,
		[PMT_Vendor1].[VendorID] AS PMT_Vendor1_VendorID,
		[PMT_Vendor1].[Description] AS PMT_Vendor1_Description,
		[PMT_Vendor1].[Active] AS PMT_Vendor1_Active 
  FROM [PMT_CQReceipts] 
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus2]
    ON [PMT_CQReceipts].[StatusID] = [PMT_BookingStatus2].[StatusID]
  INNER JOIN [PMT_Vendor] AS [PMT_Vendor1]
    ON [PMT_CQReceipts].[VendorID] = [PMT_Vendor1].[VendorID]
  WHERE
  [PMT_CQReceipts].[CQRNo] = @CQRNo
GO
