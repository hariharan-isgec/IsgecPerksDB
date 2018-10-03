USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallStatusUpdate]
  @Original_CallStatusID NVarChar(20), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITCallStatus] SET 
   [Description] = @Description
  WHERE
  [CallStatusID] = @Original_CallStatusID
  SET @RowCount = @@RowCount
GO
