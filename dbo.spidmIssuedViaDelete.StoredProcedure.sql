USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmIssuedViaDelete]
  @Original_IssuedViaID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_IssuedVia]
  WHERE
  [IDM_IssuedVia].[IssuedViaID] = @Original_IssuedViaID
  SET @RowCount = @@RowCount
GO
