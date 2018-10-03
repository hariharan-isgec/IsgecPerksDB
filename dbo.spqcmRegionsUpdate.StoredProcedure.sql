USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRegionsUpdate]
  @Original_RegionID Int, 
  @RegionName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QCM_Regions] SET 
   [RegionName] = @RegionName
  WHERE
  [RegionID] = @Original_RegionID
  SET @RowCount = @@RowCount
GO
