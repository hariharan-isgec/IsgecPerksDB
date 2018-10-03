USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSABySIDaysDelete]
  @Original_SerialNo Int,
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_SABySIDays]
  WHERE
  [ATN_SABySIDays].[SerialNo] = @Original_SerialNo
  AND [ATN_SABySIDays].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
