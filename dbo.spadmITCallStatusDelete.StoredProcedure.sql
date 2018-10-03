USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallStatusDelete]
  @Original_CallStatusID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITCallStatus]
  WHERE
  [ADM_ITCallStatus].[CallStatusID] = @Original_CallStatusID
  SET @RowCount = @@RowCount
GO
