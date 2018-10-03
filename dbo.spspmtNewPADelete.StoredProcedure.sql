USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtNewPADelete]
  @Original_AdviceNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_newPA]
  WHERE
  [SPMT_newPA].[AdviceNo] = @Original_AdviceNo
  SET @RowCount = @@RowCount
GO
