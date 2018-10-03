USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtPlacesUpdate]
  @Original_PlaceID NVarChar(30), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMT_Places] SET 
   [Description] = @Description
  WHERE
  [PlaceID] = @Original_PlaceID
  SET @RowCount = @@RowCount
GO
