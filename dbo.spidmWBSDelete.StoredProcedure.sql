USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmWBSDelete]
  @Original_WBSID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_WBS]
  WHERE
  [IDM_WBS].[WBSID] = @Original_WBSID
  SET @RowCount = @@RowCount
GO
