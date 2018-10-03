USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtIsgecGSTINDelete]
  @Original_GSTID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_IsgecGSTIN]
  WHERE
  [SPMT_IsgecGSTIN].[GSTID] = @Original_GSTID
  SET @RowCount = @@RowCount
GO
