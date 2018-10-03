USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPOStatusUpdate]
  @Original_StatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_POStatus] SET 
   [Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
