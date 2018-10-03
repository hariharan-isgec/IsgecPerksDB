USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRegionsDelete]
  @Original_RegionID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_Regions]
  WHERE
  [QCM_Regions].[RegionID] = @Original_RegionID
  SET @RowCount = @@RowCount
GO
