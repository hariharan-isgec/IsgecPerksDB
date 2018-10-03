USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtFESelectByID]
  @FEID Int 
  AS
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
  [SPMT_FE].[FEID] = @FEID
GO
