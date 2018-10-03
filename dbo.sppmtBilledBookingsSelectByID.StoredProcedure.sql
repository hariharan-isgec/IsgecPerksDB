USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtBilledBookingsSelectByID]
  @BookingID Int 
  AS
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
  [PMT_TaxiBooking].[BookingID] = @BookingID
GO
