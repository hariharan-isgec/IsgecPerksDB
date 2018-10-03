USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapStatesDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_States]
  WHERE
  [QAP_States].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
