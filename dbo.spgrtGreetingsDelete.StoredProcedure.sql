USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtGreetingsDelete]
  @Original_UserID NVarChar(8),
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [GRT_Greetings]
  WHERE
  [GRT_Greetings].[UserID] = @Original_UserID
  AND [GRT_Greetings].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
