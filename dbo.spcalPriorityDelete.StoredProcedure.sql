USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPriorityDelete]
  @Original_Priority NVarChar(1),
  @RowCount int = null OUTPUT
  AS
  DELETE [CAL_Priority]
  WHERE
  [CAL_Priority].[Priority] = @Original_Priority
  SET @RowCount = @@RowCount
GO
