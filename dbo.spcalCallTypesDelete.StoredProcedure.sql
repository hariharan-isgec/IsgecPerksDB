USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalCallTypesDelete]
  @Original_CallTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [CAL_CallTypes]
  WHERE
  [CAL_CallTypes].[CallTypeID] = @Original_CallTypeID
  SET @RowCount = @@RowCount
GO
