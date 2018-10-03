USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaTPInvoicingSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [TA_TPInvoicing].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [TA_TPInvoicing] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [TA_TPInvoicing].[EmployeeCode] = [HRM_Employees1].[CardNo]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'InvoiceNo' THEN [TA_TPInvoicing].[InvoiceNo] END,
     CASE @OrderBy WHEN 'InvoiceNo DESC' THEN [TA_TPInvoicing].[InvoiceNo] END DESC,
     CASE @OrderBy WHEN 'InvoiceDate' THEN [TA_TPInvoicing].[InvoiceDate] END,
     CASE @OrderBy WHEN 'InvoiceDate DESC' THEN [TA_TPInvoicing].[InvoiceDate] END DESC,
     CASE @OrderBy WHEN 'PAXName' THEN [TA_TPInvoicing].[PAXName] END,
     CASE @OrderBy WHEN 'PAXName DESC' THEN [TA_TPInvoicing].[PAXName] END DESC,
     CASE @OrderBy WHEN 'Sector' THEN [TA_TPInvoicing].[Sector] END,
     CASE @OrderBy WHEN 'Sector DESC' THEN [TA_TPInvoicing].[Sector] END DESC,
     CASE @OrderBy WHEN 'BookingDate' THEN [TA_TPInvoicing].[BookingDate] END,
     CASE @OrderBy WHEN 'BookingDate DESC' THEN [TA_TPInvoicing].[BookingDate] END DESC,
     CASE @OrderBy WHEN 'TravelDate' THEN [TA_TPInvoicing].[TravelDate] END,
     CASE @OrderBy WHEN 'TravelDate DESC' THEN [TA_TPInvoicing].[TravelDate] END DESC,
     CASE @OrderBy WHEN 'AirlinesName' THEN [TA_TPInvoicing].[AirlinesName] END,
     CASE @OrderBy WHEN 'AirlinesName DESC' THEN [TA_TPInvoicing].[AirlinesName] END DESC,
     CASE @OrderBy WHEN 'TicketNo' THEN [TA_TPInvoicing].[TicketNo] END,
     CASE @OrderBy WHEN 'TicketNo DESC' THEN [TA_TPInvoicing].[TicketNo] END DESC,
     CASE @OrderBy WHEN 'NetAmount' THEN [TA_TPInvoicing].[NetAmount] END,
     CASE @OrderBy WHEN 'NetAmount DESC' THEN [TA_TPInvoicing].[NetAmount] END DESC,
     CASE @OrderBy WHEN 'EmployeeCode' THEN [TA_TPInvoicing].[EmployeeCode] END,
     CASE @OrderBy WHEN 'EmployeeCode DESC' THEN [TA_TPInvoicing].[EmployeeCode] END DESC,
     CASE @OrderBy WHEN 'Sanction' THEN [TA_TPInvoicing].[Sanction] END,
     CASE @OrderBy WHEN 'Sanction DESC' THEN [TA_TPInvoicing].[Sanction] END DESC,
     CASE @OrderBy WHEN 'AirlineType' THEN [TA_TPInvoicing].[AirlineType] END,
     CASE @OrderBy WHEN 'AirlineType DESC' THEN [TA_TPInvoicing].[AirlineType] END DESC,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @OrderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC 
  SET @RecordCount = @@RowCount
GO
