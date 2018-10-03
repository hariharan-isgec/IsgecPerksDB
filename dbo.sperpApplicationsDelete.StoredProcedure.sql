USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApplicationsDelete]
  @Original_ApplID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_Applications]
  WHERE
  [ERP_Applications].[ApplID] = @Original_ApplID
  SET @RowCount = @@RowCount
GO
