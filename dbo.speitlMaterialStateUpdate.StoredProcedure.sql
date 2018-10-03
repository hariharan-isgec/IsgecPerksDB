USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMaterialStateUpdate]
  @Original_StateID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_MaterialState] SET 
   [Description] = @Description
  WHERE
  [StateID] = @Original_StateID
  SET @RowCount = @@RowCount
GO
