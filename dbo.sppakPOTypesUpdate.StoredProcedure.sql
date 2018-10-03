USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOTypesUpdate]
  @Original_POTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POTypes] SET 
   [Description] = @Description
  WHERE
  [POTypeID] = @Original_POTypeID
  SET @RowCount = @@RowCount
GO
