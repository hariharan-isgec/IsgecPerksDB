USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwLGPageSizeDelete]
  @Original_PageID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_LGPageSize]
  WHERE
  [SYS_LGPageSize].[PageID] = @Original_PageID
  SET @RowCount = @@RowCount
GO
