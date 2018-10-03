USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusUpdate]
  @Description NVarChar(30),
  @Original_CallStatusID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [CAL_Status] SET 
   [Description] = @Description
  WHERE
  [CallStatusID] = @Original_CallStatusID
  SET @RowCount = @@RowCount
GO
