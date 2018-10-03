USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskTypesDelete]
  @Original_TaskTypeID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [TOS_TaskTypes]
  WHERE
  [TOS_TaskTypes].[TaskTypeID] = @Original_TaskTypeID
  SET @RowCount = @@RowCount
GO
