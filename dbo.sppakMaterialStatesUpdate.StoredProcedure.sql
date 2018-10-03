USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakMaterialStatesUpdate]
  @Original_MaterialStateID Int, 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_MaterialStates] SET 
   [Description] = @Description
  WHERE
  [MaterialStateID] = @Original_MaterialStateID
  SET @RowCount = @@RowCount
GO
