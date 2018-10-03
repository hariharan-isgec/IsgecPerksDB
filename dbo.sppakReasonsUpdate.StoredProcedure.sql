USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReasonsUpdate]
  @Original_ReasonID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_Reasons] SET 
   [Description] = @Description
  WHERE
  [ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
