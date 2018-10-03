USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfStatusUpdate]
  @Original_PSFStatus Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PSF_Status] SET 
   [Description] = @Description
  WHERE
  [PSFStatus] = @Original_PSFStatus
  SET @RowCount = @@RowCount
GO
