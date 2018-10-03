USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestStatesDelete]
  @Original_StateID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_RequestStates]
  WHERE
  [QCM_RequestStates].[StateID] = @Original_StateID
  SET @RowCount = @@RowCount
GO
