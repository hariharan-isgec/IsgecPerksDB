USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtImagesDelete]
  @Original_ImageID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [GRT_Images]
  WHERE
  [GRT_Images].[ImageID] = @Original_ImageID
  SET @RowCount = @@RowCount
GO
