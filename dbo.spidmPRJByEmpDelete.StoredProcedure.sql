USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmPRJByEmpDelete]
  @Original_ProjectID NVarChar(6),
  @Original_CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_ProjectsByEmployee]
  WHERE
  [IDM_ProjectsByEmployee].[ProjectID] = @Original_ProjectID
  AND [IDM_ProjectsByEmployee].[CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
