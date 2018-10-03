USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfCreationDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PSF_HSBCMain]
  WHERE
  [PSF_HSBCMain].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
