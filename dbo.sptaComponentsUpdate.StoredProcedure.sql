USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaComponentsUpdate]
  @Original_ComponentID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_Components] SET 
   [Description] = @Description
  WHERE
  [ComponentID] = @Original_ComponentID
  SET @RowCount = @@RowCount
GO
