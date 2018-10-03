USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficeLocationDelete]
  @Original_LocationID Int,
  @Original_OfficeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_OfficeLocation]
  WHERE
  [HRM_OfficeLocation].[LocationID] = @Original_LocationID
  AND [HRM_OfficeLocation].[OfficeID] = @Original_OfficeID
  SET @RowCount = @@RowCount
GO
