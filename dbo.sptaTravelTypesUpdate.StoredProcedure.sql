USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelTypesUpdate]
  @Original_TravelTypeID Int, 
  @TravelTypeDescription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_TravelTypes] SET 
   [TravelTypeDescription] = @TravelTypeDescription
  WHERE
  [TravelTypeID] = @Original_TravelTypeID
  SET @RowCount = @@RowCount
GO
