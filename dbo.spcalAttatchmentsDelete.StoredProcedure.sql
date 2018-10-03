USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttatchmentsDelete]
  @Original_CallID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [CAL_Attatchments]
  WHERE
  [CAL_Attatchments].[CallID] = @Original_CallID
  AND [CAL_Attatchments].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
