USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_UFESelectListSearch]
  @Filter_VendorID NVarChar(6),
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
 ,FEID Int NOT NULL
  )
  INSERT INTO #PageIndex (FEID)
  SELECT [SPMT_FE].[FEID] FROM [SPMT_FE]
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
       [SPMT_FE].[VendorID] = (@Filter_VendorID)
   AND [SPMT_FE].[BillNo] IS NULL   
   AND ( 
         STR(ISNULL([SPMT_FE].[FEID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[RequestedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[ContactDetails],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[RequestedFor],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[Nationality],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[BookingRQNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[PassportNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[PlaceOfIssue],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[ExchangeAmountRequired], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[FOREXTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[IBRRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[DiscountPerUnit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[DiscountLimitAmount], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[PayableRate], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[EstimatedPayableAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[PlaceToBeVisited],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[DurationOfVisit], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[TotalExpenditure], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[CancelledBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[CancellationRQNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_FE].[CancellationAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[CancellationRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[BillLinkedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[BillNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[CancellationBillLinkedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_FE].[CancellationBillNo],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'FEID' THEN [SPMT_FE].[FEID] END,
     CASE @orderBy WHEN 'FEID DESC' THEN [SPMT_FE].[FEID] END DESC,
     CASE @orderBy WHEN 'RequestedBy' THEN [SPMT_FE].[RequestedBy] END,
     CASE @orderBy WHEN 'RequestedBy DESC' THEN [SPMT_FE].[RequestedBy] END DESC,
     CASE @orderBy WHEN 'ContactDetails' THEN [SPMT_FE].[ContactDetails] END,
     CASE @orderBy WHEN 'ContactDetails DESC' THEN [SPMT_FE].[ContactDetails] END DESC,
     CASE @orderBy WHEN 'RequestedFor' THEN [SPMT_FE].[RequestedFor] END,
     CASE @orderBy WHEN 'RequestedFor DESC' THEN [SPMT_FE].[RequestedFor] END DESC,
     CASE @orderBy WHEN 'Nationality' THEN [SPMT_FE].[Nationality] END,
     CASE @orderBy WHEN 'Nationality DESC' THEN [SPMT_FE].[Nationality] END DESC,
     CASE @orderBy WHEN 'BookingRQNo' THEN [SPMT_FE].[BookingRQNo] END,
     CASE @orderBy WHEN 'BookingRQNo DESC' THEN [SPMT_FE].[BookingRQNo] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_FE].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_FE].[VendorID] END DESC,
     CASE @orderBy WHEN 'PassportNumber' THEN [SPMT_FE].[PassportNumber] END,
     CASE @orderBy WHEN 'PassportNumber DESC' THEN [SPMT_FE].[PassportNumber] END DESC,
     CASE @orderBy WHEN 'PlaceOfIssue' THEN [SPMT_FE].[PlaceOfIssue] END,
     CASE @orderBy WHEN 'PlaceOfIssue DESC' THEN [SPMT_FE].[PlaceOfIssue] END DESC,
     CASE @orderBy WHEN 'DateOfIssue' THEN [SPMT_FE].[DateOfIssue] END,
     CASE @orderBy WHEN 'DateOfIssue DESC' THEN [SPMT_FE].[DateOfIssue] END DESC,
     CASE @orderBy WHEN 'ExpiryDate' THEN [SPMT_FE].[ExpiryDate] END,
     CASE @orderBy WHEN 'ExpiryDate DESC' THEN [SPMT_FE].[ExpiryDate] END DESC,
     CASE @orderBy WHEN 'ExchangeAmountRequired' THEN [SPMT_FE].[ExchangeAmountRequired] END,
     CASE @orderBy WHEN 'ExchangeAmountRequired DESC' THEN [SPMT_FE].[ExchangeAmountRequired] END DESC,
     CASE @orderBy WHEN 'RequiredOn' THEN [SPMT_FE].[RequiredOn] END,
     CASE @orderBy WHEN 'RequiredOn DESC' THEN [SPMT_FE].[RequiredOn] END DESC,
     CASE @orderBy WHEN 'FOREXTypeID' THEN [SPMT_FE].[FOREXTypeID] END,
     CASE @orderBy WHEN 'FOREXTypeID DESC' THEN [SPMT_FE].[FOREXTypeID] END DESC,
     CASE @orderBy WHEN 'IBRRate' THEN [SPMT_FE].[IBRRate] END,
     CASE @orderBy WHEN 'IBRRate DESC' THEN [SPMT_FE].[IBRRate] END DESC,
     CASE @orderBy WHEN 'TimeOfBooking' THEN [SPMT_FE].[TimeOfBooking] END,
     CASE @orderBy WHEN 'TimeOfBooking DESC' THEN [SPMT_FE].[TimeOfBooking] END DESC,
     CASE @orderBy WHEN 'DiscountPerUnit' THEN [SPMT_FE].[DiscountPerUnit] END,
     CASE @orderBy WHEN 'DiscountPerUnit DESC' THEN [SPMT_FE].[DiscountPerUnit] END DESC,
     CASE @orderBy WHEN 'DiscountLimitAmount' THEN [SPMT_FE].[DiscountLimitAmount] END,
     CASE @orderBy WHEN 'DiscountLimitAmount DESC' THEN [SPMT_FE].[DiscountLimitAmount] END DESC,
     CASE @orderBy WHEN 'PayableRate' THEN [SPMT_FE].[PayableRate] END,
     CASE @orderBy WHEN 'PayableRate DESC' THEN [SPMT_FE].[PayableRate] END DESC,
     CASE @orderBy WHEN 'EstimatedPayableAmount' THEN [SPMT_FE].[EstimatedPayableAmount] END,
     CASE @orderBy WHEN 'EstimatedPayableAmount DESC' THEN [SPMT_FE].[EstimatedPayableAmount] END DESC,
     CASE @orderBy WHEN 'PlaceToBeVisited' THEN [SPMT_FE].[PlaceToBeVisited] END,
     CASE @orderBy WHEN 'PlaceToBeVisited DESC' THEN [SPMT_FE].[PlaceToBeVisited] END DESC,
     CASE @orderBy WHEN 'DurationOfVisit' THEN [SPMT_FE].[DurationOfVisit] END,
     CASE @orderBy WHEN 'DurationOfVisit DESC' THEN [SPMT_FE].[DurationOfVisit] END DESC,
     CASE @orderBy WHEN 'TotalExpenditure' THEN [SPMT_FE].[TotalExpenditure] END,
     CASE @orderBy WHEN 'TotalExpenditure DESC' THEN [SPMT_FE].[TotalExpenditure] END DESC,
     CASE @orderBy WHEN 'CreatedBy' THEN [SPMT_FE].[CreatedBy] END,
     CASE @orderBy WHEN 'CreatedBy DESC' THEN [SPMT_FE].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'CreatedOn' THEN [SPMT_FE].[CreatedOn] END,
     CASE @orderBy WHEN 'CreatedOn DESC' THEN [SPMT_FE].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'Cancelled' THEN [SPMT_FE].[Cancelled] END,
     CASE @orderBy WHEN 'Cancelled DESC' THEN [SPMT_FE].[Cancelled] END DESC,
     CASE @orderBy WHEN 'CancelledOn' THEN [SPMT_FE].[CancelledOn] END,
     CASE @orderBy WHEN 'CancelledOn DESC' THEN [SPMT_FE].[CancelledOn] END DESC,
     CASE @orderBy WHEN 'CancelledBy' THEN [SPMT_FE].[CancelledBy] END,
     CASE @orderBy WHEN 'CancelledBy DESC' THEN [SPMT_FE].[CancelledBy] END DESC,
     CASE @orderBy WHEN 'CancellationRQNo' THEN [SPMT_FE].[CancellationRQNo] END,
     CASE @orderBy WHEN 'CancellationRQNo DESC' THEN [SPMT_FE].[CancellationRQNo] END DESC,
     CASE @orderBy WHEN 'CancellationAmount' THEN [SPMT_FE].[CancellationAmount] END,
     CASE @orderBy WHEN 'CancellationAmount DESC' THEN [SPMT_FE].[CancellationAmount] END DESC,
     CASE @orderBy WHEN 'CancellationRemarks' THEN [SPMT_FE].[CancellationRemarks] END,
     CASE @orderBy WHEN 'CancellationRemarks DESC' THEN [SPMT_FE].[CancellationRemarks] END DESC,
     CASE @orderBy WHEN 'BillLinked' THEN [SPMT_FE].[BillLinked] END,
     CASE @orderBy WHEN 'BillLinked DESC' THEN [SPMT_FE].[BillLinked] END DESC,
     CASE @orderBy WHEN 'BillLinkedOn' THEN [SPMT_FE].[BillLinkedOn] END,
     CASE @orderBy WHEN 'BillLinkedOn DESC' THEN [SPMT_FE].[BillLinkedOn] END DESC,
     CASE @orderBy WHEN 'BillLinkedBy' THEN [SPMT_FE].[BillLinkedBy] END,
     CASE @orderBy WHEN 'BillLinkedBy DESC' THEN [SPMT_FE].[BillLinkedBy] END DESC,
     CASE @orderBy WHEN 'BillNo' THEN [SPMT_FE].[BillNo] END,
     CASE @orderBy WHEN 'BillNo DESC' THEN [SPMT_FE].[BillNo] END DESC,
     CASE @orderBy WHEN 'BillDate' THEN [SPMT_FE].[BillDate] END,
     CASE @orderBy WHEN 'BillDate DESC' THEN [SPMT_FE].[BillDate] END DESC,
     CASE @orderBy WHEN 'CancellationBillLinked' THEN [SPMT_FE].[CancellationBillLinked] END,
     CASE @orderBy WHEN 'CancellationBillLinked DESC' THEN [SPMT_FE].[CancellationBillLinked] END DESC,
     CASE @orderBy WHEN 'CancellationBillLinkedBy' THEN [SPMT_FE].[CancellationBillLinkedBy] END,
     CASE @orderBy WHEN 'CancellationBillLinkedBy DESC' THEN [SPMT_FE].[CancellationBillLinkedBy] END DESC,
     CASE @orderBy WHEN 'CancellationBillLinkedOn' THEN [SPMT_FE].[CancellationBillLinkedOn] END,
     CASE @orderBy WHEN 'CancellationBillLinkedOn DESC' THEN [SPMT_FE].[CancellationBillLinkedOn] END DESC,
     CASE @orderBy WHEN 'CancellationBillNo' THEN [SPMT_FE].[CancellationBillNo] END,
     CASE @orderBy WHEN 'CancellationBillNo DESC' THEN [SPMT_FE].[CancellationBillNo] END DESC,
     CASE @orderBy WHEN 'CancellationBillDate' THEN [SPMT_FE].[CancellationBillDate] END,
     CASE @orderBy WHEN 'CancellationBillDate DESC' THEN [SPMT_FE].[CancellationBillDate] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees5_EmployeeName' THEN [HRM_Employees5].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees5_EmployeeName DESC' THEN [HRM_Employees5].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'SPMT_ForexTypes6_Description' THEN [SPMT_ForexTypes6].[Description] END,
     CASE @orderBy WHEN 'SPMT_ForexTypes6_Description DESC' THEN [SPMT_ForexTypes6].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Places7_Description' THEN [SPMT_Places7].[Description] END,
     CASE @orderBy WHEN 'SPMT_Places7_Description DESC' THEN [SPMT_Places7].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Places8_Description' THEN [SPMT_Places8].[Description] END,
     CASE @orderBy WHEN 'SPMT_Places8_Description DESC' THEN [SPMT_Places8].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors9_Description' THEN [SPMT_Vendors9].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors9_Description DESC' THEN [SPMT_Vendors9].[Description] END DESC 

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
