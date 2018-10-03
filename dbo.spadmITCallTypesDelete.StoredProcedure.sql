USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallTypesDelete]
  @Original_CallTypeID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITCallTypes]
  WHERE
  [ADM_ITCallTypes].[CallTypeID] = @Original_CallTypeID
  SET @RowCount = @@RowCount
GO
