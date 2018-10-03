USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptaTPInvoicingSelectListFilteres]
  @Filter_BookingDate NVarChar(20), 
  @Filter_TravelDate NVarChar(20), 
  @Filter_EmployeeCode NVarChar(8),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT, 
  @TotalAmount Decimal = 0 OUTPUT  
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,InvoiceNo NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'InvoiceNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_TPInvoicing].[InvoiceNo]'
  SET @LGSQL = @LGSQL + ' FROM [TA_TPInvoicing] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [TA_TPInvoicing].[EmployeeCode] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_BookingDate > '' AND @Filter_TravelDate > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_TPInvoicing].[TravelDate] BETWEEN CONVERT(DateTime, ''' + @Filter_BookingDate + ''', 103) AND CONVERT(DateTime, ''' + @Filter_TravelDate + ''', 103) '
  IF (@Filter_EmployeeCode > '') 
    SET @LGSQL = @LGSQL + ' AND [TA_TPInvoicing].[EmployeeCode] = ''' + @Filter_EmployeeCode + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'InvoiceNo' THEN '[TA_TPInvoicing].[InvoiceNo]'
                        WHEN 'InvoiceNo DESC' THEN '[TA_TPInvoicing].[InvoiceNo] DESC'
                        WHEN 'InvoiceDate' THEN '[TA_TPInvoicing].[InvoiceDate]'
                        WHEN 'InvoiceDate DESC' THEN '[TA_TPInvoicing].[InvoiceDate] DESC'
                        WHEN 'PAXName' THEN '[TA_TPInvoicing].[PAXName]'
                        WHEN 'PAXName DESC' THEN '[TA_TPInvoicing].[PAXName] DESC'
                        WHEN 'Sector' THEN '[TA_TPInvoicing].[Sector]'
                        WHEN 'Sector DESC' THEN '[TA_TPInvoicing].[Sector] DESC'
                        WHEN 'BookingDate' THEN '[TA_TPInvoicing].[BookingDate]'
                        WHEN 'BookingDate DESC' THEN '[TA_TPInvoicing].[BookingDate] DESC'
                        WHEN 'TravelDate' THEN '[TA_TPInvoicing].[TravelDate]'
                        WHEN 'TravelDate DESC' THEN '[TA_TPInvoicing].[TravelDate] DESC'
                        WHEN 'AirlinesName' THEN '[TA_TPInvoicing].[AirlinesName]'
                        WHEN 'AirlinesName DESC' THEN '[TA_TPInvoicing].[AirlinesName] DESC'
                        WHEN 'TicketNo' THEN '[TA_TPInvoicing].[TicketNo]'
                        WHEN 'TicketNo DESC' THEN '[TA_TPInvoicing].[TicketNo] DESC'
                        WHEN 'NetAmount' THEN '[TA_TPInvoicing].[NetAmount]'
                        WHEN 'NetAmount DESC' THEN '[TA_TPInvoicing].[NetAmount] DESC'
                        WHEN 'EmployeeCode' THEN '[TA_TPInvoicing].[EmployeeCode]'
                        WHEN 'EmployeeCode DESC' THEN '[TA_TPInvoicing].[EmployeeCode] DESC'
                        WHEN 'Sanction' THEN '[TA_TPInvoicing].[Sanction]'
                        WHEN 'Sanction DESC' THEN '[TA_TPInvoicing].[Sanction] DESC'
                        WHEN 'AirlineType' THEN '[TA_TPInvoicing].[AirlineType]'
                        WHEN 'AirlineType DESC' THEN '[TA_TPInvoicing].[AirlineType] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        ELSE '[TA_TPInvoicing].[InvoiceNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT @TotalAmount = ISNULL(SUM(NetAmount),0)  
  FROM [TA_TPInvoicing] 
      INNER JOIN #PageIndex
          ON [TA_TPInvoicing].[InvoiceNo] = #PageIndex.InvoiceNo


  SELECT
    [TA_TPInvoicing].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [TA_TPInvoicing] 
      INNER JOIN #PageIndex
          ON [TA_TPInvoicing].[InvoiceNo] = #PageIndex.InvoiceNo
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [TA_TPInvoicing].[EmployeeCode] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
