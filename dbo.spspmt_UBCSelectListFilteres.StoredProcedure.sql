USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmt_UBCSelectListFilteres]
  @Filter_VendorID NVarChar(6),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,BCID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BCID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_BC].[BCID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_BC] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[CreatedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[CancelledBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[BillLinkedBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[RequestedBy] = [HRM_Employees4].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Places] AS [SPMT_Places5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[FromPlaceID] = [SPMT_Places5].[PlaceID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Places] AS [SPMT_Places6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[ToPlaceID] = [SPMT_Places6].[PlaceID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [SPMT_Vendors] AS [SPMT_Vendors7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[VendorID] = [SPMT_Vendors7].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_BC].[CancellationBillLinkedBy] = [aspnet_Users8].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE [SPMT_BC].[BillNo] IS NULL '
  IF (@Filter_VendorID > '') 
    SET @LGSQL = @LGSQL + ' AND [SPMT_BC].[VendorID] = ''' + @Filter_VendorID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BCID' THEN '[SPMT_BC].[BCID]'
                        WHEN 'BCID DESC' THEN '[SPMT_BC].[BCID] DESC'
                        WHEN 'RequestedBy' THEN '[SPMT_BC].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[SPMT_BC].[RequestedBy] DESC'
                        WHEN 'RequestedFor' THEN '[SPMT_BC].[RequestedFor]'
                        WHEN 'RequestedFor DESC' THEN '[SPMT_BC].[RequestedFor] DESC'
                        WHEN 'BookingRQNo' THEN '[SPMT_BC].[BookingRQNo]'
                        WHEN 'BookingRQNo DESC' THEN '[SPMT_BC].[BookingRQNo] DESC'
                        WHEN 'VendorID' THEN '[SPMT_BC].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_BC].[VendorID] DESC'
                        WHEN 'FromPlaceID' THEN '[SPMT_BC].[FromPlaceID]'
                        WHEN 'FromPlaceID DESC' THEN '[SPMT_BC].[FromPlaceID] DESC'
                        WHEN 'ToPlaceID' THEN '[SPMT_BC].[ToPlaceID]'
                        WHEN 'ToPlaceID DESC' THEN '[SPMT_BC].[ToPlaceID] DESC'
                        WHEN 'AirLines' THEN '[SPMT_BC].[AirLines]'
                        WHEN 'AirLines DESC' THEN '[SPMT_BC].[AirLines] DESC'
                        WHEN 'FlightTime' THEN '[SPMT_BC].[FlightTime]'
                        WHEN 'FlightTime DESC' THEN '[SPMT_BC].[FlightTime] DESC'
                        WHEN 'EstimatedAmount' THEN '[SPMT_BC].[EstimatedAmount]'
                        WHEN 'EstimatedAmount DESC' THEN '[SPMT_BC].[EstimatedAmount] DESC'
                        WHEN 'CreatedBy' THEN '[SPMT_BC].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[SPMT_BC].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[SPMT_BC].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[SPMT_BC].[CreatedOn] DESC'
                        WHEN 'Cancelled' THEN '[SPMT_BC].[Cancelled]'
                        WHEN 'Cancelled DESC' THEN '[SPMT_BC].[Cancelled] DESC'
                        WHEN 'CancellationRQNo' THEN '[SPMT_BC].[CancellationRQNo]'
                        WHEN 'CancellationRQNo DESC' THEN '[SPMT_BC].[CancellationRQNo] DESC'
                        WHEN 'CancelledOn' THEN '[SPMT_BC].[CancelledOn]'
                        WHEN 'CancelledOn DESC' THEN '[SPMT_BC].[CancelledOn] DESC'
                        WHEN 'CancelledBy' THEN '[SPMT_BC].[CancelledBy]'
                        WHEN 'CancelledBy DESC' THEN '[SPMT_BC].[CancelledBy] DESC'
                        WHEN 'CancellationAmount' THEN '[SPMT_BC].[CancellationAmount]'
                        WHEN 'CancellationAmount DESC' THEN '[SPMT_BC].[CancellationAmount] DESC'
                        WHEN 'CancellationRemarks' THEN '[SPMT_BC].[CancellationRemarks]'
                        WHEN 'CancellationRemarks DESC' THEN '[SPMT_BC].[CancellationRemarks] DESC'
                        WHEN 'BillLinked' THEN '[SPMT_BC].[BillLinked]'
                        WHEN 'BillLinked DESC' THEN '[SPMT_BC].[BillLinked] DESC'
                        WHEN 'BillLinkedOn' THEN '[SPMT_BC].[BillLinkedOn]'
                        WHEN 'BillLinkedOn DESC' THEN '[SPMT_BC].[BillLinkedOn] DESC'
                        WHEN 'BillLinkedBy' THEN '[SPMT_BC].[BillLinkedBy]'
                        WHEN 'BillLinkedBy DESC' THEN '[SPMT_BC].[BillLinkedBy] DESC'
                        WHEN 'BillNo' THEN '[SPMT_BC].[BillNo]'
                        WHEN 'BillNo DESC' THEN '[SPMT_BC].[BillNo] DESC'
                        WHEN 'BillDate' THEN '[SPMT_BC].[BillDate]'
                        WHEN 'BillDate DESC' THEN '[SPMT_BC].[BillDate] DESC'
                        WHEN 'CancellationBillLinked' THEN '[SPMT_BC].[CancellationBillLinked]'
                        WHEN 'CancellationBillLinked DESC' THEN '[SPMT_BC].[CancellationBillLinked] DESC'
                        WHEN 'CancellationBillLinkedBy' THEN '[SPMT_BC].[CancellationBillLinkedBy]'
                        WHEN 'CancellationBillLinkedBy DESC' THEN '[SPMT_BC].[CancellationBillLinkedBy] DESC'
                        WHEN 'CancellationBillLinkedOn' THEN '[SPMT_BC].[CancellationBillLinkedOn]'
                        WHEN 'CancellationBillLinkedOn DESC' THEN '[SPMT_BC].[CancellationBillLinkedOn] DESC'
                        WHEN 'CancellationBillNo' THEN '[SPMT_BC].[CancellationBillNo]'
                        WHEN 'CancellationBillNo DESC' THEN '[SPMT_BC].[CancellationBillNo] DESC'
                        WHEN 'CancellationBillDate' THEN '[SPMT_BC].[CancellationBillDate]'
                        WHEN 'CancellationBillDate DESC' THEN '[SPMT_BC].[CancellationBillDate] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'HRM_Employees4_EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'HRM_Employees4_EmployeeName DESC' THEN '[HRM_Employees4].[EmployeeName] DESC'
                        WHEN 'SPMT_Places5_Description' THEN '[SPMT_Places].[Description]'
                        WHEN 'SPMT_Places5_Description DESC' THEN '[SPMT_Places5].[Description] DESC'
                        WHEN 'SPMT_Places6_Description' THEN '[SPMT_Places].[Description]'
                        WHEN 'SPMT_Places6_Description DESC' THEN '[SPMT_Places6].[Description] DESC'
                        WHEN 'SPMT_Vendors7_Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'SPMT_Vendors7_Description DESC' THEN '[SPMT_Vendors7].[Description] DESC'
                        WHEN 'aspnet_Users8_UserFullName' THEN '[aspnet_Users].[UserFullName]'
                        WHEN 'aspnet_Users8_UserFullName DESC' THEN '[aspnet_Users8].[UserFullName] DESC'
                        ELSE '[SPMT_BC].[BCID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [SPMT_BC].[BCID] = #PageIndex.BCID
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
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
