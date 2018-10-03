USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallSubTypesDelete]
  @Original_CallTypeID NVarChar(20),
  @Original_CallSubTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITCallSubTypes]
  WHERE
  [ADM_ITCallSubTypes].[CallTypeID] = @Original_CallTypeID
  AND [ADM_ITCallSubTypes].[CallSubTypeID] = @Original_CallSubTypeID
  SET @RowCount = @@RowCount
GO
