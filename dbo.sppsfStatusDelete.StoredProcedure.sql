USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfStatusDelete]
  @Original_PSFStatus Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PSF_Status]
  WHERE
  [PSF_Status].[PSFStatus] = @Original_PSFStatus
  SET @RowCount = @@RowCount
GO
