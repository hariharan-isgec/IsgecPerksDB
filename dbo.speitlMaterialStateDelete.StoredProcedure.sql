USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMaterialStateDelete]
  @Original_StateID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_MaterialState]
  WHERE
  [EITL_MaterialState].[StateID] = @Original_StateID
  SET @RowCount = @@RowCount
GO
