USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionsDelete]
  @Original_RegionID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_Regions]
  WHERE
  [TA_Regions].[RegionID] = @Original_RegionID
  SET @RowCount = @@RowCount
GO
