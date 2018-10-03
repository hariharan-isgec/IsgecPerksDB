USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSoftwaresDelete]
  @Original_SoftwareID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [AST_Softwares]
  WHERE
  [AST_Softwares].[SoftwareID] = @Original_SoftwareID
  SET @RowCount = @@RowCount
GO
