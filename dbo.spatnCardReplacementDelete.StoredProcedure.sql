USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnCardReplacementDelete]
  @Original_ReplacedCardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_CardReplacement]
  WHERE
  [ATN_CardReplacement].[ReplacedCardNo] = @Original_ReplacedCardNo
  SET @RowCount = @@RowCount
GO
