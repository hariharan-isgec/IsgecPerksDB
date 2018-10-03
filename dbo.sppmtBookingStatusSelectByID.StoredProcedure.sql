USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtBookingStatusSelectByID]
  @StatusID Int 
  AS
  SELECT
		[PMT_BookingStatus].[StatusID],
		[PMT_BookingStatus].[Description] 
  FROM [PMT_BookingStatus] 
  WHERE
  [PMT_BookingStatus].[StatusID] = @StatusID
GO
