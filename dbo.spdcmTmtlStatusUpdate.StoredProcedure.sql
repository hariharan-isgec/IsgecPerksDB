USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmTmtlStatusUpdate]
  @Original_StatusID NVarChar(1), 
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [DCM_TmtlStatus] SET 
   [Description] = @Description
  WHERE
  [StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
