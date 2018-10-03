USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectsDelete]
  @Original_ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_Projects]
  WHERE
  [IDM_Projects].[ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
