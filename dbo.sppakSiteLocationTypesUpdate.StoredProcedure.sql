USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteLocationTypesUpdate]
  @Original_LocationTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteLocationTypes] SET 
   [Description] = @Description
  WHERE
  [LocationTypeID] = @Original_LocationTypeID
  SET @RowCount = @@RowCount
GO
