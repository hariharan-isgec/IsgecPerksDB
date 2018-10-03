USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLocationsDelete]
  @Original_LocationID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [ASM_AstLocations]
  WHERE
  [ASM_AstLocations].[LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
