USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrODCReasonsUpdate]
  @Original_ReasonID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_ODCReasons] SET 
   [Description] = @Description
  WHERE
  [ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
