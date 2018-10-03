USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusDelete]
  @Original_CallStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [CAL_Status]
  WHERE
  [CAL_Status].[CallStatusID] = @Original_CallStatusID
  SET @RowCount = @@RowCount
GO
