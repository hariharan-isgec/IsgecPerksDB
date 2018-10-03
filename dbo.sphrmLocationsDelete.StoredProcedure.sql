USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmLocationsDelete]
  @Original_LocationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Locations]
  WHERE
  [HRM_Locations].[LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
