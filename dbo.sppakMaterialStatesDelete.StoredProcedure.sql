USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakMaterialStatesDelete]
  @Original_MaterialStateID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_MaterialStates]
  WHERE
  [VR_MaterialStates].[MaterialStateID] = @Original_MaterialStateID
  SET @RowCount = @@RowCount
GO
