USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtTaxiBookingSelectListSearch]
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
 ,BookingID Int NOT NULL
  )
  INSERT INTO #PageIndex (BookingID)
  SELECT [PMT_TaxiBooking].[BookingID] FROM [PMT_TaxiBooking]
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMT_TaxiBooking].[RequestedBy] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMT_TaxiBooking].[BookedBy] = [HRM_Employees2].[CardNo]
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
   ( 
         STR(ISNULL([PMT_TaxiBooking].[BookingID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_TaxiBooking].[RequestedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_TaxiBooking].[BookedFor],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_TaxiBooking].[FromPlace],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_TaxiBooking].[ToPlace],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_TaxiBooking].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_TaxiBooking].[VehicleID],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_TaxiBooking].[EstimatedAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_TaxiBooking].[BookedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMT_TaxiBooking].[StatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PMT_TaxiBooking].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees1].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees1].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees2].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees2].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Places3].[PlaceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Places3].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Places4].[PlaceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Places4].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vehicle5].[VehicleID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vehicle5].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor6].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor6].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_BookingStatus7].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'BookingID' THEN [PMT_TaxiBooking].[BookingID] END,
     CASE @orderBy WHEN 'BookingID DESC' THEN [PMT_TaxiBooking].[BookingID] END DESC,
     CASE @orderBy WHEN 'RequestedBy' THEN [PMT_TaxiBooking].[RequestedBy] END,
     CASE @orderBy WHEN 'RequestedBy DESC' THEN [PMT_TaxiBooking].[RequestedBy] END DESC,
     CASE @orderBy WHEN 'RequestedOn' THEN [PMT_TaxiBooking].[RequestedOn] END,
     CASE @orderBy WHEN 'RequestedOn DESC' THEN [PMT_TaxiBooking].[RequestedOn] END DESC,
     CASE @orderBy WHEN 'BookedFor' THEN [PMT_TaxiBooking].[BookedFor] END,
     CASE @orderBy WHEN 'BookedFor DESC' THEN [PMT_TaxiBooking].[BookedFor] END DESC,
     CASE @orderBy WHEN 'FromDate' THEN [PMT_TaxiBooking].[FromDate] END,
     CASE @orderBy WHEN 'FromDate DESC' THEN [PMT_TaxiBooking].[FromDate] END DESC,
     CASE @orderBy WHEN 'TillDate' THEN [PMT_TaxiBooking].[TillDate] END,
     CASE @orderBy WHEN 'TillDate DESC' THEN [PMT_TaxiBooking].[TillDate] END DESC,
     CASE @orderBy WHEN 'FromPlace' THEN [PMT_TaxiBooking].[FromPlace] END,
     CASE @orderBy WHEN 'FromPlace DESC' THEN [PMT_TaxiBooking].[FromPlace] END DESC,
     CASE @orderBy WHEN 'ToPlace' THEN [PMT_TaxiBooking].[ToPlace] END,
     CASE @orderBy WHEN 'ToPlace DESC' THEN [PMT_TaxiBooking].[ToPlace] END DESC,
     CASE @orderBy WHEN 'TaxiReportingTime' THEN [PMT_TaxiBooking].[TaxiReportingTime] END,
     CASE @orderBy WHEN 'TaxiReportingTime DESC' THEN [PMT_TaxiBooking].[TaxiReportingTime] END DESC,
     CASE @orderBy WHEN 'VendorID' THEN [PMT_TaxiBooking].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [PMT_TaxiBooking].[VendorID] END DESC,
     CASE @orderBy WHEN 'VehicleID' THEN [PMT_TaxiBooking].[VehicleID] END,
     CASE @orderBy WHEN 'VehicleID DESC' THEN [PMT_TaxiBooking].[VehicleID] END DESC,
     CASE @orderBy WHEN 'EstimatedAmount' THEN [PMT_TaxiBooking].[EstimatedAmount] END,
     CASE @orderBy WHEN 'EstimatedAmount DESC' THEN [PMT_TaxiBooking].[EstimatedAmount] END DESC,
     CASE @orderBy WHEN 'BookedBy' THEN [PMT_TaxiBooking].[BookedBy] END,
     CASE @orderBy WHEN 'BookedBy DESC' THEN [PMT_TaxiBooking].[BookedBy] END DESC,
     CASE @orderBy WHEN 'BookedOn' THEN [PMT_TaxiBooking].[BookedOn] END,
     CASE @orderBy WHEN 'BookedOn DESC' THEN [PMT_TaxiBooking].[BookedOn] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [PMT_TaxiBooking].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PMT_TaxiBooking].[StatusID] END DESC,
     CASE @orderBy WHEN 'BillReceived' THEN [PMT_TaxiBooking].[BillReceived] END,
     CASE @orderBy WHEN 'BillReceived DESC' THEN [PMT_TaxiBooking].[BillReceived] END DESC,
     CASE @orderBy WHEN 'IRNo' THEN [PMT_TaxiBooking].[IRNo] END,
     CASE @orderBy WHEN 'IRNo DESC' THEN [PMT_TaxiBooking].[IRNo] END DESC,
     CASE @orderBy WHEN 'IRDt' THEN [PMT_TaxiBooking].[IRDt] END,
     CASE @orderBy WHEN 'IRDt DESC' THEN [PMT_TaxiBooking].[IRDt] END DESC,
     CASE @orderBy WHEN 'BillPosted' THEN [PMT_TaxiBooking].[BillPosted] END,
     CASE @orderBy WHEN 'BillPosted DESC' THEN [PMT_TaxiBooking].[BillPosted] END DESC,
     CASE @orderBy WHEN 'CQReceived' THEN [PMT_TaxiBooking].[CQReceived] END,
     CASE @orderBy WHEN 'CQReceived DESC' THEN [PMT_TaxiBooking].[CQReceived] END DESC,
     CASE @orderBy WHEN 'CQDelivered' THEN [PMT_TaxiBooking].[CQDelivered] END,
     CASE @orderBy WHEN 'CQDelivered DESC' THEN [PMT_TaxiBooking].[CQDelivered] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo' THEN [HRM_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees1_CardNo DESC' THEN [HRM_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName' THEN [HRM_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees1_EmployeeName DESC' THEN [HRM_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID' THEN [HRM_Employees1].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees1_C_OfficeID DESC' THEN [HRM_Employees1].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo' THEN [HRM_Employees2].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees2_CardNo DESC' THEN [HRM_Employees2].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName' THEN [HRM_Employees2].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees2_EmployeeName DESC' THEN [HRM_Employees2].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID' THEN [HRM_Employees2].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees2_C_OfficeID DESC' THEN [HRM_Employees2].[C_OfficeID] END DESC,
     CASE @orderBy WHEN 'PMT_Places3_PlaceID' THEN [PMT_Places3].[PlaceID] END,
     CASE @orderBy WHEN 'PMT_Places3_PlaceID DESC' THEN [PMT_Places3].[PlaceID] END DESC,
     CASE @orderBy WHEN 'PMT_Places3_Description' THEN [PMT_Places3].[Description] END,
     CASE @orderBy WHEN 'PMT_Places3_Description DESC' THEN [PMT_Places3].[Description] END DESC,
     CASE @orderBy WHEN 'PMT_Places4_PlaceID' THEN [PMT_Places4].[PlaceID] END,
     CASE @orderBy WHEN 'PMT_Places4_PlaceID DESC' THEN [PMT_Places4].[PlaceID] END DESC,
     CASE @orderBy WHEN 'PMT_Places4_Description' THEN [PMT_Places4].[Description] END,
     CASE @orderBy WHEN 'PMT_Places4_Description DESC' THEN [PMT_Places4].[Description] END DESC,
     CASE @orderBy WHEN 'PMT_Vehicle5_VehicleID' THEN [PMT_Vehicle5].[VehicleID] END,
     CASE @orderBy WHEN 'PMT_Vehicle5_VehicleID DESC' THEN [PMT_Vehicle5].[VehicleID] END DESC,
     CASE @orderBy WHEN 'PMT_Vehicle5_Description' THEN [PMT_Vehicle5].[Description] END,
     CASE @orderBy WHEN 'PMT_Vehicle5_Description DESC' THEN [PMT_Vehicle5].[Description] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor6_VendorID' THEN [PMT_Vendor6].[VendorID] END,
     CASE @orderBy WHEN 'PMT_Vendor6_VendorID DESC' THEN [PMT_Vendor6].[VendorID] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor6_Description' THEN [PMT_Vendor6].[Description] END,
     CASE @orderBy WHEN 'PMT_Vendor6_Description DESC' THEN [PMT_Vendor6].[Description] END DESC,
     CASE @orderBy WHEN 'PMT_Vendor6_Active' THEN [PMT_Vendor6].[Active] END,
     CASE @orderBy WHEN 'PMT_Vendor6_Active DESC' THEN [PMT_Vendor6].[Active] END DESC,
     CASE @orderBy WHEN 'PMT_BookingStatus7_StatusID' THEN [PMT_BookingStatus7].[StatusID] END,
     CASE @orderBy WHEN 'PMT_BookingStatus7_StatusID DESC' THEN [PMT_BookingStatus7].[StatusID] END DESC,
     CASE @orderBy WHEN 'PMT_BookingStatus7_Description' THEN [PMT_BookingStatus7].[Description] END,
     CASE @orderBy WHEN 'PMT_BookingStatus7_Description DESC' THEN [PMT_BookingStatus7].[Description] END DESC 

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
		[PMT_TaxiBooking].[TaxiReportingTime],
		[PMT_TaxiBooking].[VendorID],
		[PMT_TaxiBooking].[VehicleID],
		[PMT_TaxiBooking].[EstimatedAmount],
		[PMT_TaxiBooking].[BookedBy],
		[PMT_TaxiBooking].[BookedOn],
		[PMT_TaxiBooking].[StatusID],
		[PMT_TaxiBooking].[BillReceived],
		[PMT_TaxiBooking].[IRNo],
		[PMT_TaxiBooking].[IRDt],
		[PMT_TaxiBooking].[BillPosted],
		[PMT_TaxiBooking].[CQReceived],
		[PMT_TaxiBooking].[CQDelivered],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees2].[CardNo] AS HRM_Employees2_CardNo,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees2].[C_OfficeID] AS HRM_Employees2_C_OfficeID,
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
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMT_TaxiBooking].[BookedBy] = [HRM_Employees2].[CardNo]
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
