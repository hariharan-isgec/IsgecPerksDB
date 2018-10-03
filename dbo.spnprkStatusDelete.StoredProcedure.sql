USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkStatusDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Status]
  WHERE
  [PRK_Status].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
