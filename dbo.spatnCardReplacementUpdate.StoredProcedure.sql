USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnCardReplacementUpdate]
  @CardNo NVarChar(8),
  @Original_ReplacedCardNo NVarChar(8), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_CardReplacement] SET 
   [CardNo] = @CardNo
  WHERE
  [ReplacedCardNo] = @Original_ReplacedCardNo
  SET @RowCount = @@RowCount
GO
