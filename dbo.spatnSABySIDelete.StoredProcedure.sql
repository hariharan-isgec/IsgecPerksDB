USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_SABySI]
  WHERE
  [ATN_SABySI].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
