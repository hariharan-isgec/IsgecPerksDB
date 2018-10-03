USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtPlacesUpdate]
  @Original_PlaceID NVarChar(30), 
  @PlaceID NVarChar(30),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_Places] SET 
   [PlaceID] = @PlaceID
  ,[Description] = @Description
  WHERE
  [PlaceID] = @Original_PlaceID
  SET @RowCount = @@RowCount
GO
