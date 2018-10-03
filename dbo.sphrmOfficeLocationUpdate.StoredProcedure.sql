USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficeLocationUpdate]
  @Original_LocationID Int, 
  @Original_OfficeID Int, 
  @LocationID Int,
  @OfficeID Int,
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_OfficeLocation] SET 
   [LocationID] = @LocationID
  ,[OfficeID] = @OfficeID
  ,[Description] = @Description
  WHERE
  [LocationID] = @Original_LocationID
  AND [OfficeID] = @Original_OfficeID
  SET @RowCount = @@RowCount
GO
