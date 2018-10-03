USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesUpdate]
  @Description NVarChar(30),
  @Original_JoiningStateID NVarChar(2), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_JoiningStates] SET 
   [Description] = @Description
  WHERE
  [JoiningStateID] = @Original_JoiningStateID
  SET @RowCount = @@RowCount
GO
