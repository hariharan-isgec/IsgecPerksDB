USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkStatusUpdate]
  @Description NVarChar(20),
  @Original_StatusID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Status] SET 
   [Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
