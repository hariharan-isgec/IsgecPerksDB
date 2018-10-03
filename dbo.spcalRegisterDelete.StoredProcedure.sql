USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalRegisterDelete]
  @Original_CallID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [CAL_Register]
  WHERE
  [CAL_Register].[CallID] = @Original_CallID
  SET @RowCount = @@RowCount
GO
