USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPStatesDelete]
  @Original_StateID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_ERPStates]
  WHERE
  [SPMT_ERPStates].[StateID] = @Original_StateID
  SET @RowCount = @@RowCount
GO
