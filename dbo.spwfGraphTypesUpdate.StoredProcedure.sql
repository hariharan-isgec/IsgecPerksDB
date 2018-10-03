USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfGraphTypesUpdate]
  @Original_GraphTypeID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_GraphTypes] SET 
   [Description] = @Description
  WHERE
  [GraphTypeID] = @Original_GraphTypeID
  SET @RowCount = @@RowCount
GO
