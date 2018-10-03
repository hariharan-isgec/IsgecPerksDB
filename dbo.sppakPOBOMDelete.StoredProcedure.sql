USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOBOMDelete]
  @Original_SerialNo Int,
  @Original_BOMNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PAK_POBOM]
  WHERE
  [PAK_POBOM].[SerialNo] = @Original_SerialNo
  AND [PAK_POBOM].[BOMNo] = @Original_BOMNo
  SET @RowCount = @@RowCount
GO
