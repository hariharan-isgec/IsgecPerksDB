USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallTypesDelete]
  @Original_CallTypeID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_CallTypes]
  WHERE
  [ADM_CallTypes].[CallTypeID] = @Original_CallTypeID
  SET @RowCount = @@RowCount
GO
