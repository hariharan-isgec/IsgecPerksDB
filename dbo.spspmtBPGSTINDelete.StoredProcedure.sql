USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBPGSTINDelete]
  @Original_BPID NVarChar(9),
  @Original_GSTIN Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_BPGSTIN]
  WHERE
  [VR_BPGSTIN].[BPID] = @Original_BPID
  AND [VR_BPGSTIN].[GSTIN] = @Original_GSTIN
  SET @RowCount = @@RowCount
GO
