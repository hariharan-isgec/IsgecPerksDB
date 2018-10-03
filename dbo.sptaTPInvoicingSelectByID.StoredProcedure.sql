USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaTPInvoicingSelectByID]
  @LoginID NVarChar(8),
  @InvoiceNo NVarChar(15) 
  AS
  SELECT
    [TA_TPInvoicing].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [TA_TPInvoicing] 
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [TA_TPInvoicing].[EmployeeCode] = [HRM_Employees1].[CardNo]
  WHERE
  [TA_TPInvoicing].[InvoiceNo] = @InvoiceNo
GO
