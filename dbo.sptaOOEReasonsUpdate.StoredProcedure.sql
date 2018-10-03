USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaOOEReasonsUpdate]
  @Original_ReasonID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_OOEReasons] SET 
   [Description] = @Description
  WHERE
  [ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO
