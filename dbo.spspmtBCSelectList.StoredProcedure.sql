USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBCSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[SPMT_BC].[BCID] ,
		[SPMT_BC].[RequestedBy] ,
		[SPMT_BC].[RequestedFor] ,
		[SPMT_BC].[BookingRQNo] ,
		[SPMT_BC].[VendorID] ,
		[SPMT_BC].[FromPlaceID] ,
		[SPMT_BC].[ToPlaceID] ,
		[SPMT_BC].[AirLines] ,
		[SPMT_BC].[FlightTime] ,
		[SPMT_BC].[EstimatedAmount] ,
		[SPMT_BC].[CreatedBy] ,
		[SPMT_BC].[CreatedOn] ,
		[SPMT_BC].[Cancelled] ,
		[SPMT_BC].[CancellationRQNo] ,
		[SPMT_BC].[CancelledOn] ,
		[SPMT_BC].[CancelledBy] ,
		[SPMT_BC].[CancellationAmount] ,
		[SPMT_BC].[CancellationRemarks] ,
		[SPMT_BC].[BillLinked] ,
		[SPMT_BC].[BillLinkedOn] ,
		[SPMT_BC].[BillLinkedBy] ,
		[SPMT_BC].[BillNo] ,
		[SPMT_BC].[BillDate] ,
		[SPMT_BC].[CancellationBillLinked] ,
		[SPMT_BC].[CancellationBillLinkedBy] ,
		[SPMT_BC].[CancellationBillLinkedOn] ,
		[SPMT_BC].[CancellationBillNo] ,
		[SPMT_BC].[CancellationBillDate] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
		[SPMT_Places5].[Description] AS SPMT_Places5_Description,
		[SPMT_Places6].[Description] AS SPMT_Places6_Description,
		[SPMT_Vendors7].[Description] AS SPMT_Vendors7_Description,
		[aspnet_Users8].[UserFullName] AS aspnet_Users8_UserFullName 
  FROM [SPMT_BC] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [SPMT_BC].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [SPMT_BC].[CancelledBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [SPMT_BC].[BillLinkedBy] = [aspnet_Users3].[LoginID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [SPMT_BC].[RequestedBy] = [HRM_Employees4].[CardNo]
  INNER JOIN [SPMT_Places] AS [SPMT_Places5]
    ON [SPMT_BC].[FromPlaceID] = [SPMT_Places5].[PlaceID]
  INNER JOIN [SPMT_Places] AS [SPMT_Places6]
    ON [SPMT_BC].[ToPlaceID] = [SPMT_Places6].[PlaceID]
  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors7]
    ON [SPMT_BC].[VendorID] = [SPMT_Vendors7].[VendorID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users8]
    ON [SPMT_BC].[CancellationBillLinkedBy] = [aspnet_Users8].[LoginID]
  WHERE 1 = 1  
  ORDER BY
     CASE @orderBy WHEN 'BCID' THEN [SPMT_BC].[BCID] END,
     CASE @orderBy WHEN 'BCID DESC' THEN [SPMT_BC].[BCID] END DESC,
     CASE @orderBy WHEN 'RequestedBy' THEN [SPMT_BC].[RequestedBy] END,
     CASE @orderBy WHEN 'RequestedBy DESC' THEN [SPMT_BC].[RequestedBy] END DESC,
     CASE @orderBy WHEN 'RequestedFor' THEN [SPMT_BC].[RequestedFor] END,
     CASE @orderBy WHEN 'RequestedFor DESC' THEN [SPMT_BC].[RequestedFor] END DESC,
     CASE @orderBy WHEN 'BookingRQNo' THEN [SPMT_BC].[BookingRQNo] END,
     CASE @orderBy WHEN 'BookingRQNo DESC' THEN [SPMT_BC].[BookingRQNo] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_BC].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_BC].[VendorID] END DESC,
     CASE @orderBy WHEN 'FromPlaceID' THEN [SPMT_BC].[FromPlaceID] END,
     CASE @orderBy WHEN 'FromPlaceID DESC' THEN [SPMT_BC].[FromPlaceID] END DESC,
     CASE @orderBy WHEN 'ToPlaceID' THEN [SPMT_BC].[ToPlaceID] END,
     CASE @orderBy WHEN 'ToPlaceID DESC' THEN [SPMT_BC].[ToPlaceID] END DESC,
     CASE @orderBy WHEN 'AirLines' THEN [SPMT_BC].[AirLines] END,
     CASE @orderBy WHEN 'AirLines DESC' THEN [SPMT_BC].[AirLines] END DESC,
     CASE @orderBy WHEN 'FlightTime' THEN [SPMT_BC].[FlightTime] END,
     CASE @orderBy WHEN 'FlightTime DESC' THEN [SPMT_BC].[FlightTime] END DESC,
     CASE @orderBy WHEN 'EstimatedAmount' THEN [SPMT_BC].[EstimatedAmount] END,
     CASE @orderBy WHEN 'EstimatedAmount DESC' THEN [SPMT_BC].[EstimatedAmount] END DESC,
     CASE @orderBy WHEN 'CreatedBy' THEN [SPMT_BC].[CreatedBy] END,
     CASE @orderBy WHEN 'CreatedBy DESC' THEN [SPMT_BC].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'CreatedOn' THEN [SPMT_BC].[CreatedOn] END,
     CASE @orderBy WHEN 'CreatedOn DESC' THEN [SPMT_BC].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'Cancelled' THEN [SPMT_BC].[Cancelled] END,
     CASE @orderBy WHEN 'Cancelled DESC' THEN [SPMT_BC].[Cancelled] END DESC,
     CASE @orderBy WHEN 'CancellationRQNo' THEN [SPMT_BC].[CancellationRQNo] END,
     CASE @orderBy WHEN 'CancellationRQNo DESC' THEN [SPMT_BC].[CancellationRQNo] END DESC,
     CASE @orderBy WHEN 'CancelledOn' THEN [SPMT_BC].[CancelledOn] END,
     CASE @orderBy WHEN 'CancelledOn DESC' THEN [SPMT_BC].[CancelledOn] END DESC,
     CASE @orderBy WHEN 'CancelledBy' THEN [SPMT_BC].[CancelledBy] END,
     CASE @orderBy WHEN 'CancelledBy DESC' THEN [SPMT_BC].[CancelledBy] END DESC,
     CASE @orderBy WHEN 'CancellationAmount' THEN [SPMT_BC].[CancellationAmount] END,
     CASE @orderBy WHEN 'CancellationAmount DESC' THEN [SPMT_BC].[CancellationAmount] END DESC,
     CASE @orderBy WHEN 'CancellationRemarks' THEN [SPMT_BC].[CancellationRemarks] END,
     CASE @orderBy WHEN 'CancellationRemarks DESC' THEN [SPMT_BC].[CancellationRemarks] END DESC,
     CASE @orderBy WHEN 'BillLinked' THEN [SPMT_BC].[BillLinked] END,
     CASE @orderBy WHEN 'BillLinked DESC' THEN [SPMT_BC].[BillLinked] END DESC,
     CASE @orderBy WHEN 'BillLinkedOn' THEN [SPMT_BC].[BillLinkedOn] END,
     CASE @orderBy WHEN 'BillLinkedOn DESC' THEN [SPMT_BC].[BillLinkedOn] END DESC,
     CASE @orderBy WHEN 'BillLinkedBy' THEN [SPMT_BC].[BillLinkedBy] END,
     CASE @orderBy WHEN 'BillLinkedBy DESC' THEN [SPMT_BC].[BillLinkedBy] END DESC,
     CASE @orderBy WHEN 'BillNo' THEN [SPMT_BC].[BillNo] END,
     CASE @orderBy WHEN 'BillNo DESC' THEN [SPMT_BC].[BillNo] END DESC,
     CASE @orderBy WHEN 'BillDate' THEN [SPMT_BC].[BillDate] END,
     CASE @orderBy WHEN 'BillDate DESC' THEN [SPMT_BC].[BillDate] END DESC,
     CASE @orderBy WHEN 'CancellationBillLinked' THEN [SPMT_BC].[CancellationBillLinked] END,
     CASE @orderBy WHEN 'CancellationBillLinked DESC' THEN [SPMT_BC].[CancellationBillLinked] END DESC,
     CASE @orderBy WHEN 'CancellationBillLinkedBy' THEN [SPMT_BC].[CancellationBillLinkedBy] END,
     CASE @orderBy WHEN 'CancellationBillLinkedBy DESC' THEN [SPMT_BC].[CancellationBillLinkedBy] END DESC,
     CASE @orderBy WHEN 'CancellationBillLinkedOn' THEN [SPMT_BC].[CancellationBillLinkedOn] END,
     CASE @orderBy WHEN 'CancellationBillLinkedOn DESC' THEN [SPMT_BC].[CancellationBillLinkedOn] END DESC,
     CASE @orderBy WHEN 'CancellationBillNo' THEN [SPMT_BC].[CancellationBillNo] END,
     CASE @orderBy WHEN 'CancellationBillNo DESC' THEN [SPMT_BC].[CancellationBillNo] END DESC,
     CASE @orderBy WHEN 'CancellationBillDate' THEN [SPMT_BC].[CancellationBillDate] END,
     CASE @orderBy WHEN 'CancellationBillDate DESC' THEN [SPMT_BC].[CancellationBillDate] END DESC,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees4_EmployeeName' THEN [HRM_Employees4].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees4_EmployeeName DESC' THEN [HRM_Employees4].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'SPMT_Places5_Description' THEN [SPMT_Places5].[Description] END,
     CASE @orderBy WHEN 'SPMT_Places5_Description DESC' THEN [SPMT_Places5].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Places6_Description' THEN [SPMT_Places6].[Description] END,
     CASE @orderBy WHEN 'SPMT_Places6_Description DESC' THEN [SPMT_Places6].[Description] END DESC,
     CASE @orderBy WHEN 'SPMT_Vendors7_Description' THEN [SPMT_Vendors7].[Description] END,
     CASE @orderBy WHEN 'SPMT_Vendors7_Description DESC' THEN [SPMT_Vendors7].[Description] END DESC,
     CASE @orderBy WHEN 'aspnet_Users8_UserFullName' THEN [aspnet_Users8].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users8_UserFullName DESC' THEN [aspnet_Users8].[UserFullName] END DESC 
  SET @RecordCount = @@RowCount
GO
