USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmLocationsUpdate]
  @Original_LocationID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Locations] SET 
   [Description] = @Description
  WHERE
  [LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
