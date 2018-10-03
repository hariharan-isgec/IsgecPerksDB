USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgStatusUpdate]
  @Original_StatusID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_PkgStatus] SET 
   [Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
