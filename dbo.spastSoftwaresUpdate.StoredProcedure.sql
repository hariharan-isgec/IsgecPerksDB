USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSoftwaresUpdate]
  @Description NVarChar(100),
  @Original_SoftwareID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_Softwares] SET 
   [Description] = @Description
  WHERE
  [SoftwareID] = @Original_SoftwareID
  SET @RowCount = @@RowCount
GO
