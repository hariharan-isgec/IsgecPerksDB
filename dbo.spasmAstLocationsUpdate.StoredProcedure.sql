USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLocationsUpdate]
  @Original_LocationID NVarChar(20), 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstLocations] SET 
   [Description] = @Description
  WHERE
  [LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
