USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApplicationsUpdate]
  @Original_ApplID Int, 
  @ApplName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_Applications] SET 
   [ApplName] = @ApplName
  WHERE
  [ApplID] = @Original_ApplID
  SET @RowCount = @@RowCount
GO
