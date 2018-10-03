USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtBilledBookingsSelectListFilteres]
  @Filter_IRNo Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,BookingID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BookingID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMT_TaxiBooking].[BookingID]'
  SET @LGSQL = @LGSQL + ' FROM [PMT_TaxiBooking] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PMT_TaxiBooking].[RequestedBy] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_Places] AS [PMT_Places3]'
  SET @LGSQL = @LGSQL + '    ON [PMT_TaxiBooking].[FromPlace] = [PMT_Places3].[PlaceID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_Places] AS [PMT_Places4]'
  SET @LGSQL = @LGSQL + '    ON [PMT_TaxiBooking].[ToPlace] = [PMT_Places4].[PlaceID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_Vehicle] AS [PMT_Vehicle5]'
  SET @LGSQL = @LGSQL + '    ON [PMT_TaxiBooking].[VehicleID] = [PMT_Vehicle5].[VehicleID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_Vendor] AS [PMT_Vendor6]'
  SET @LGSQL = @LGSQL + '    ON [PMT_TaxiBooking].[VendorID] = [PMT_Vendor6].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus7]'
  SET @LGSQL = @LGSQL + '    ON [PMT_TaxiBooking].[StatusID] = [PMT_BookingStatus7].[StatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_IRNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [PMT_TaxiBooking].[IRNo] = ' + STR(@Filter_IRNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BookingID' THEN '[PMT_TaxiBooking].[BookingID]'
                        WHEN 'BookingID DESC' THEN '[PMT_TaxiBooking].[BookingID] DESC'
                        WHEN 'RequestedBy' THEN '[PMT_TaxiBooking].[RequestedBy]'
                        WHEN 'RequestedBy DESC' THEN '[PMT_TaxiBooking].[RequestedBy] DESC'
                        WHEN 'RequestedOn' THEN '[PMT_TaxiBooking].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[PMT_TaxiBooking].[RequestedOn] DESC'
                        WHEN 'BookedFor' THEN '[PMT_TaxiBooking].[BookedFor]'
                        WHEN 'BookedFor DESC' THEN '[PMT_TaxiBooking].[BookedFor] DESC'
                        WHEN 'FromDate' THEN '[PMT_TaxiBooking].[FromDate]'
                        WHEN 'FromDate DESC' THEN '[PMT_TaxiBooking].[FromDate] DESC'
                        WHEN 'TillDate' THEN '[PMT_TaxiBooking].[TillDate]'
                        WHEN 'TillDate DESC' THEN '[PMT_TaxiBooking].[TillDate] DESC'
                        WHEN 'FromPlace' THEN '[PMT_TaxiBooking].[FromPlace]'
                        WHEN 'FromPlace DESC' THEN '[PMT_TaxiBooking].[FromPlace] DESC'
                        WHEN 'ToPlace' THEN '[PMT_TaxiBooking].[ToPlace]'
                        WHEN 'ToPlace DESC' THEN '[PMT_TaxiBooking].[ToPlace] DESC'
                        WHEN 'VendorID' THEN '[PMT_TaxiBooking].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[PMT_TaxiBooking].[VendorID] DESC'
                        WHEN 'VehicleID' THEN '[PMT_TaxiBooking].[VehicleID]'
                        WHEN 'VehicleID DESC' THEN '[PMT_TaxiBooking].[VehicleID] DESC'
                        WHEN 'EstimatedAmount' THEN '[PMT_TaxiBooking].[EstimatedAmount]'
                        WHEN 'EstimatedAmount DESC' THEN '[PMT_TaxiBooking].[EstimatedAmount] DESC'
                        WHEN 'BookedOn' THEN '[PMT_TaxiBooking].[BookedOn]'
                        WHEN 'BookedOn DESC' THEN '[PMT_TaxiBooking].[BookedOn] DESC'
                        WHEN 'BillReceived' THEN '[PMT_TaxiBooking].[BillReceived]'
                        WHEN 'BillReceived DESC' THEN '[PMT_TaxiBooking].[BillReceived] DESC'
                        WHEN 'IRNo' THEN '[PMT_TaxiBooking].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[PMT_TaxiBooking].[IRNo] DESC'
                        WHEN 'IRDt' THEN '[PMT_TaxiBooking].[IRDt]'
                        WHEN 'IRDt DESC' THEN '[PMT_TaxiBooking].[IRDt] DESC'
                        WHEN 'StatusID' THEN '[PMT_TaxiBooking].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PMT_TaxiBooking].[StatusID] DESC'
                        WHEN 'CQDelivered' THEN '[PMT_TaxiBooking].[CQDelivered]'
                        WHEN 'CQDelivered DESC' THEN '[PMT_TaxiBooking].[CQDelivered] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'PMT_Places3_PlaceID' THEN '[PMT_Places3].[PlaceID]'
                        WHEN 'PMT_Places3_PlaceID DESC' THEN '[PMT_Places3].[PlaceID] DESC'
                        WHEN 'PMT_Places3_Description' THEN '[PMT_Places3].[Description]'
                        WHEN 'PMT_Places3_Description DESC' THEN '[PMT_Places3].[Description] DESC'
                        WHEN 'PMT_Places4_PlaceID' THEN '[PMT_Places4].[PlaceID]'
                        WHEN 'PMT_Places4_PlaceID DESC' THEN '[PMT_Places4].[PlaceID] DESC'
                        WHEN 'PMT_Places4_Description' THEN '[PMT_Places4].[Description]'
                        WHEN 'PMT_Places4_Description DESC' THEN '[PMT_Places4].[Description] DESC'
                        WHEN 'PMT_Vehicle5_VehicleID' THEN '[PMT_Vehicle5].[VehicleID]'
                        WHEN 'PMT_Vehicle5_VehicleID DESC' THEN '[PMT_Vehicle5].[VehicleID] DESC'
                        WHEN 'PMT_Vehicle5_Description' THEN '[PMT_Vehicle5].[Description]'
                        WHEN 'PMT_Vehicle5_Description DESC' THEN '[PMT_Vehicle5].[Description] DESC'
                        WHEN 'PMT_Vendor6_VendorID' THEN '[PMT_Vendor6].[VendorID]'
                        WHEN 'PMT_Vendor6_VendorID DESC' THEN '[PMT_Vendor6].[VendorID] DESC'
                        WHEN 'PMT_Vendor6_Description' THEN '[PMT_Vendor6].[Description]'
                        WHEN 'PMT_Vendor6_Description DESC' THEN '[PMT_Vendor6].[Description] DESC'
                        WHEN 'PMT_Vendor6_Active' THEN '[PMT_Vendor6].[Active]'
                        WHEN 'PMT_Vendor6_Active DESC' THEN '[PMT_Vendor6].[Active] DESC'
                        WHEN 'PMT_BookingStatus7_StatusID' THEN '[PMT_BookingStatus7].[StatusID]'
                        WHEN 'PMT_BookingStatus7_StatusID DESC' THEN '[PMT_BookingStatus7].[StatusID] DESC'
                        WHEN 'PMT_BookingStatus7_Description' THEN '[PMT_BookingStatus7].[Description]'
                        WHEN 'PMT_BookingStatus7_Description DESC' THEN '[PMT_BookingStatus7].[Description] DESC'
                        ELSE '[PMT_TaxiBooking].[BookingID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMT_TaxiBooking].[BookingID],
		[PMT_TaxiBooking].[RequestedBy],
		[PMT_TaxiBooking].[RequestedOn],
		[PMT_TaxiBooking].[BookedFor],
		[PMT_TaxiBooking].[FromDate],
		[PMT_TaxiBooking].[TillDate],
		[PMT_TaxiBooking].[FromPlace],
		[PMT_TaxiBooking].[ToPlace],
		[PMT_TaxiBooking].[VendorID],
		[PMT_TaxiBooking].[VehicleID],
		[PMT_TaxiBooking].[EstimatedAmount],
		[PMT_TaxiBooking].[BookedOn],
		[PMT_TaxiBooking].[BillReceived],
		[PMT_TaxiBooking].[BillPosted],
		[PMT_TaxiBooking].[IRNo],
		[PMT_TaxiBooking].[IRDt],
		[PMT_TaxiBooking].[StatusID],
		[PMT_TaxiBooking].[CQDelivered],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[PMT_Places3].[PlaceID] AS PMT_Places3_PlaceID,
		[PMT_Places3].[Description] AS PMT_Places3_Description,
		[PMT_Places4].[PlaceID] AS PMT_Places4_PlaceID,
		[PMT_Places4].[Description] AS PMT_Places4_Description,
		[PMT_Vehicle5].[VehicleID] AS PMT_Vehicle5_VehicleID,
		[PMT_Vehicle5].[Description] AS PMT_Vehicle5_Description,
		[PMT_Vendor6].[VendorID] AS PMT_Vendor6_VendorID,
		[PMT_Vendor6].[Description] AS PMT_Vendor6_Description,
		[PMT_Vendor6].[Active] AS PMT_Vendor6_Active,
		[PMT_BookingStatus7].[StatusID] AS PMT_BookingStatus7_StatusID,
		[PMT_BookingStatus7].[Description] AS PMT_BookingStatus7_Description 
  FROM [PMT_TaxiBooking] 
    	INNER JOIN #PageIndex
          ON [PMT_TaxiBooking].[BookingID] = #PageIndex.BookingID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMT_TaxiBooking].[RequestedBy] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [PMT_Places] AS [PMT_Places3]
    ON [PMT_TaxiBooking].[FromPlace] = [PMT_Places3].[PlaceID]
  LEFT OUTER JOIN [PMT_Places] AS [PMT_Places4]
    ON [PMT_TaxiBooking].[ToPlace] = [PMT_Places4].[PlaceID]
  LEFT OUTER JOIN [PMT_Vehicle] AS [PMT_Vehicle5]
    ON [PMT_TaxiBooking].[VehicleID] = [PMT_Vehicle5].[VehicleID]
  LEFT OUTER JOIN [PMT_Vendor] AS [PMT_Vendor6]
    ON [PMT_TaxiBooking].[VendorID] = [PMT_Vendor6].[VendorID]
  LEFT OUTER JOIN [PMT_BookingStatus] AS [PMT_BookingStatus7]
    ON [PMT_TaxiBooking].[StatusID] = [PMT_BookingStatus7].[StatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
