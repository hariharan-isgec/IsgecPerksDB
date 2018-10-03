USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBCSelectByID]
  @BCID Int 
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
  WHERE
  [SPMT_BC].[BCID] = @BCID
GO
