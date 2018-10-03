USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficesDelete]
  @Original_OfficeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Offices]
  WHERE
  [HRM_Offices].[OfficeID] = @Original_OfficeID
  SET @RowCount = @@RowCount
GO
