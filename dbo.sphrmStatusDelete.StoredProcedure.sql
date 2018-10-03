USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusDelete]
  @Original_StatusID NVarChar(2),
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_Status]
  WHERE
  [HRM_Status].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
