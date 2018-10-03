USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormStatusDelete]
  @Original_FormStatusID NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  DELETE [PMS_FormStatus]
  WHERE
  [PMS_FormStatus].[FormStatusID] = @Original_FormStatusID
  SET @RowCount = @@RowCount
GO
