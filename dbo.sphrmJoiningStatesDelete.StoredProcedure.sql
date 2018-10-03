USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesDelete]
  @Original_JoiningStateID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_JoiningStates]
  WHERE
  [HRM_JoiningStates].[JoiningStateID] = @Original_JoiningStateID
  SET @RowCount = @@RowCount
GO
