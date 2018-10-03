USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastLocationsUpdate]
  @Descriptions NVarChar(30),
  @Original_LocationID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_Locations] SET 
   [Descriptions] = @Descriptions
  WHERE
  [LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO
