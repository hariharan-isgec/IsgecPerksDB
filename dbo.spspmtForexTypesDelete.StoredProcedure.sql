USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtForexTypesDelete]
  @Original_FOREXTypeID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_ForexTypes]
  WHERE
  [SPMT_ForexTypes].[FOREXTypeID] = @Original_FOREXTypeID
  SET @RowCount = @@RowCount
GO
