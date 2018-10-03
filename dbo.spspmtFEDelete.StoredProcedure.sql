USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtFEDelete]
  @Original_FEID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_FE]
  WHERE
  [SPMT_FE].[FEID] = @Original_FEID
  SET @RowCount = @@RowCount
GO
