USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_SBFESelectListFilteres]
  @Filter_BillNo Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,FEID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FEID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_FE].[FEID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_FE] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[CreatedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[CancelledBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[BillLinkedBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[CancellationBillLinkedBy] = [aspnet_Users4].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[RequestedBy] = [HRM_Employees5].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_ForexTypes] AS [SPMT_ForexTypes6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[FOREXTypeID] = [SPMT_ForexTypes6].[FOREXTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_Places] AS [SPMT_Places7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[PlaceToBeVisited] = [SPMT_Places7].[PlaceID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_Places] AS [SPMT_Places8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[PlaceOfIssue] = [SPMT_Places8].[PlaceID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_FE].[VendorID] = [SPMT_Vendors9].[VendorID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_BillNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [SPMT_FE].[BillNo] = ' + STR(@Filter_BillNo) 
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FEID' THEN '[SPMT_FE].[FEID]'
                        WHEN 'FEID DESC' THEN '[SPMT_FE].[FEID] DESC'
                        WHEN 'RequestedBy' THEN '[SPMT_FE].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[SPMT_FE].[RequestedBy] DESC'
                        WHEN 'ContactDetails' THEN '[SPMT_FE].[ContactDetails]'
                        WHEN 'ContactDetails DESC' THEN '[SPMT_FE].[ContactDetails] DESC'
                        WHEN 'RequestedFor' THEN '[SPMT_FE].[RequestedFor]'
                        WHEN 'RequestedFor DESC' THEN '[SPMT_FE].[RequestedFor] DESC'
                        WHEN 'Nationality' THEN '[SPMT_FE].[Nationality]'
                        WHEN 'Nationality DESC' THEN '[SPMT_FE].[Nationality] DESC'
                        WHEN 'BookingRQNo' THEN '[SPMT_FE].[BookingRQNo]'
                        WHEN 'BookingRQNo DESC' THEN '[SPMT_FE].[BookingRQNo] DESC'
                        WHEN 'VendorID' THEN '[SPMT_FE].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_FE].[VendorID] DESC'
                        WHEN 'PassportNumber' THEN '[SPMT_FE].[PassportNumber]'
                        WHEN 'PassportNumber DESC' THEN '[SPMT_FE].[PassportNumber] DESC'
                        WHEN 'PlaceOfIssue' THEN '[SPMT_FE].[PlaceOfIssue]'
                        WHEN 'PlaceOfIssue DESC' THEN '[SPMT_FE].[PlaceOfIssue] DESC'
                        WHEN 'DateOfIssue' THEN '[SPMT_FE].[DateOfIssue]'
                        WHEN 'DateOfIssue DESC' THEN '[SPMT_FE].[DateOfIssue] DESC'
                        WHEN 'ExpiryDate' THEN '[SPMT_FE].[ExpiryDate]'
                        WHEN 'ExpiryDate DESC' THEN '[SPMT_FE].[ExpiryDate] DESC'
                        WHEN 'ExchangeAmountRequired' THEN '[SPMT_FE].[ExchangeAmountRequired]'
                        WHEN 'ExchangeAmountRequired DESC' THEN '[SPMT_FE].[ExchangeAmountRequired] DESC'
                        WHEN 'RequiredOn' THEN '[SPMT_FE].[RequiredOn]'
                        WHEN 'RequiredOn DESC' THEN '[SPMT_FE].[RequiredOn] DESC'
                        WHEN 'FOREXTypeID' THEN '[SPMT_FE].[FOREXTypeID]'
                        WHEN 'FOREXTypeID DESC' THEN '[SPMT_FE].[FOREXTypeID] DESC'
                        WHEN 'IBRRate' THEN '[SPMT_FE].[IBRRate]'
                        WHEN 'IBRRate DESC' THEN '[SPMT_FE].[IBRRate] DESC'
                        WHEN 'TimeOfBooking' THEN '[SPMT_FE].[TimeOfBooking]'
                        WHEN 'TimeOfBooking DESC' THEN '[SPMT_FE].[TimeOfBooking] DESC'
                        WHEN 'DiscountPerUnit' THEN '[SPMT_FE].[DiscountPerUnit]'
                        WHEN 'DiscountPerUnit DESC' THEN '[SPMT_FE].[DiscountPerUnit] DESC'
                        WHEN 'DiscountLimitAmount' THEN '[SPMT_FE].[DiscountLimitAmount]'
                        WHEN 'DiscountLimitAmount DESC' THEN '[SPMT_FE].[DiscountLimitAmount] DESC'
                        WHEN 'PayableRate' THEN '[SPMT_FE].[PayableRate]'
                        WHEN 'PayableRate DESC' THEN '[SPMT_FE].[PayableRate] DESC'
                        WHEN 'EstimatedPayableAmount' THEN '[SPMT_FE].[EstimatedPayableAmount]'
                        WHEN 'EstimatedPayableAmount DESC' THEN '[SPMT_FE].[EstimatedPayableAmount] DESC'
                        WHEN 'PlaceToBeVisited' THEN '[SPMT_FE].[PlaceToBeVisited]'
                        WHEN 'PlaceToBeVisited DESC' THEN '[SPMT_FE].[PlaceToBeVisited] DESC'
                        WHEN 'DurationOfVisit' THEN '[SPMT_FE].[DurationOfVisit]'
                        WHEN 'DurationOfVisit DESC' THEN '[SPMT_FE].[DurationOfVisit] DESC'
                        WHEN 'TotalExpenditure' THEN '[SPMT_FE].[TotalExpenditure]'
                        WHEN 'TotalExpenditure DESC' THEN '[SPMT_FE].[TotalExpenditure] DESC'
                        WHEN 'CreatedBy' THEN '[SPMT_FE].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[SPMT_FE].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[SPMT_FE].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[SPMT_FE].[CreatedOn] DESC'
                        WHEN 'Cancelled' THEN '[SPMT_FE].[Cancelled]'
                        WHEN 'Cancelled DESC' THEN '[SPMT_FE].[Cancelled] DESC'
                        WHEN 'CancelledOn' THEN '[SPMT_FE].[CancelledOn]'
                        WHEN 'CancelledOn DESC' THEN '[SPMT_FE].[CancelledOn] DESC'
                        WHEN 'CancelledBy' THEN '[SPMT_FE].[CancelledBy]'
                        WHEN 'CancelledBy DESC' THEN '[SPMT_FE].[CancelledBy] DESC'
                        WHEN 'CancellationRQNo' THEN '[SPMT_FE].[CancellationRQNo]'
                        WHEN 'CancellationRQNo DESC' THEN '[SPMT_FE].[CancellationRQNo] DESC'
                        WHEN 'CancellationAmount' THEN '[SPMT_FE].[CancellationAmount]'
                        WHEN 'CancellationAmount DESC' THEN '[SPMT_FE].[CancellationAmount] DESC'
                        WHEN 'CancellationRemarks' THEN '[SPMT_FE].[CancellationRemarks]'
                        WHEN 'CancellationRemarks DESC' THEN '[SPMT_FE].[CancellationRemarks] DESC'
                        WHEN 'BillLinked' THEN '[SPMT_FE].[BillLinked]'
                        WHEN 'BillLinked DESC' THEN '[SPMT_FE].[BillLinked] DESC'
                        WHEN 'BillLinkedOn' THEN '[SPMT_FE].[BillLinkedOn]'
                        WHEN 'BillLinkedOn DESC' THEN '[SPMT_FE].[BillLinkedOn] DESC'
                        WHEN 'BillLinkedBy' THEN '[SPMT_FE].[BillLinkedBy]'
                        WHEN 'BillLinkedBy DESC' THEN '[SPMT_FE].[BillLinkedBy] DESC'
                        WHEN 'BillNo' THEN '[SPMT_FE].[BillNo]'
                        WHEN 'BillNo DESC' THEN '[SPMT_FE].[BillNo] DESC'
                        WHEN 'BillDate' THEN '[SPMT_FE].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[SPMT_FE].[BillDate] DESC'
                        WHEN 'CancellationBillLinked' THEN '[SPMT_FE].[CancellationBillLinked]'
                        WHEN 'CancellationBillLinked DESC' THEN '[SPMT_FE].[CancellationBillLinked] DESC'
                        WHEN 'CancellationBillLinkedBy' THEN '[SPMT_FE].[CancellationBillLinkedBy]'
                        WHEN 'CancellationBillLinkedBy DESC' THEN '[SPMT_FE].[CancellationBillLinkedBy] DESC'
                        WHEN 'CancellationBillLinkedOn' THEN '[SPMT_FE].[CancellationBillLinkedOn]'
                        WHEN 'CancellationBillLinkedOn DESC' THEN '[SPMT_FE].[CancellationBillLinkedOn] DESC'
                        WHEN 'CancellationBillNo' THEN '[SPMT_FE].[CancellationBillNo]'
                        WHEN 'CancellationBillNo DESC' THEN '[SPMT_FE].[CancellationBillNo] DESC'
                        WHEN 'CancellationBillDate' THEN '[SPMT_FE].[CancellationBillDate]'
                        WHEN 'CancellationBillDate DESC' THEN '[SPMT_FE].[CancellationBillDate] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        WHEN 'HRM_Employees5_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees5_EmployeeName DESC' THEN '[HRM_Employees5].[EmployeeName] DESC'
                        WHEN 'SPMT_ForexTypes6_Description' THEN '[SPMT_ForexTypes].[Description]'
                        WHEN 'SPMT_ForexTypes6_Description DESC' THEN '[SPMT_ForexTypes6].[Description] DESC'
                        WHEN 'SPMT_Places7_Description' THEN '[SPMT_Places].[Description]'
                        WHEN 'SPMT_Places7_Description DESC' THEN '[SPMT_Places7].[Description] DESC'
                        WHEN 'SPMT_Places8_Description' THEN '[SPMT_Places].[Description]'
                        WHEN 'SPMT_Places8_Description DESC' THEN '[SPMT_Places8].[Description] DESC'
                        WHEN 'SPMT_Vendors9_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors9_Description DESC' THEN '[SPMT_Vendors9].[Description] DESC'
                        ELSE '[SPMT_FE].[FEID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_FE].[FEID] ,
		[SPMT_FE].[RequestedBy] ,
		[SPMT_FE].[ContactDetails] ,
		[SPMT_FE].[RequestedFor] ,
		[SPMT_FE].[Nationality] ,
		[SPMT_FE].[BookingRQNo] ,
		[SPMT_FE].[VendorID] ,
		[SPMT_FE].[PassportNumber] ,
		[SPMT_FE].[PlaceOfIssue] ,
		[SPMT_FE].[DateOfIssue] ,
		[SPMT_FE].[ExpiryDate] ,
		[SPMT_FE].[ExchangeAmountRequired] ,
		[SPMT_FE].[RequiredOn] ,
		[SPMT_FE].[FOREXTypeID] ,
		[SPMT_FE].[IBRRate] ,
		[SPMT_FE].[TimeOfBooking] ,
		[SPMT_FE].[DiscountPerUnit] ,
		[SPMT_FE].[DiscountLimitAmount] ,
		[SPMT_FE].[PayableRate] ,
		[SPMT_FE].[EstimatedPayableAmount] ,
		[SPMT_FE].[PlaceToBeVisited] ,
		[SPMT_FE].[DurationOfVisit] ,
		[SPMT_FE].[TotalExpenditure] ,
		[SPMT_FE].[CreatedBy] ,
		[SPMT_FE].[CreatedOn] ,
		[SPMT_FE].[Cancelled] ,
		[SPMT_FE].[CancelledOn] ,
		[SPMT_FE].[CancelledBy] ,
		[SPMT_FE].[CancellationRQNo] ,
		[SPMT_FE].[CancellationAmount] ,
		[SPMT_FE].[CancellationRemarks] ,
		[SPMT_FE].[BillLinked] ,
		[SPMT_FE].[BillLinkedOn] ,
		[SPMT_FE].[BillLinkedBy] ,
		[SPMT_FE].[BillNo] ,
		[SPMT_FE].[BillDate] ,
		[SPMT_FE].[CancellationBillLinked] ,
		[SPMT_FE].[CancellationBillLinkedBy] ,
		[SPMT_FE].[CancellationBillLinkedOn] ,
		[SPMT_FE].[CancellationBillNo] ,
		[SPMT_FE].[CancellationBillDate] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName,
		[HRM_Employees5].[EmployeeName] AS HRM_Employees5_EmployeeName,
		[SPMT_ForexTypes6].[Description] AS SPMT_ForexTypes6_Description,
		[SPMT_Places7].[Description] AS SPMT_Places7_Description,
		[SPMT_Places8].[Description] AS SPMT_Places8_Description,
		[SPMT_Vendors9].[Description] AS SPMT_Vendors9_Description 
  FROM [SPMT_FE] 
    	INNER JOIN #PageIndex
          ON [SPMT_FE].[FEID] = #PageIndex.FEID
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_FE].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_FE].[CancelledBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [SPMT_FE].[BillLinkedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [SPMT_FE].[CancellationBillLinkedBy] = [aspnet_Users4].[LoginID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees5]
    ON [SPMT_FE].[RequestedBy] = [HRM_Employees5].[CardNo]
  INNER JOIN [SPMT_ForexTypes] AS [SPMT_ForexTypes6]
    ON [SPMT_FE].[FOREXTypeID] = [SPMT_ForexTypes6].[FOREXTypeID]
  LEFT OUTER JOIN [SPMT_Places] AS [SPMT_Places7]
    ON [SPMT_FE].[PlaceToBeVisited] = [SPMT_Places7].[PlaceID]
  LEFT OUTER JOIN [SPMT_Places] AS [SPMT_Places8]
    ON [SPMT_FE].[PlaceOfIssue] = [SPMT_Places8].[PlaceID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors9]
    ON [SPMT_FE].[VendorID] = [SPMT_Vendors9].[VendorID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
