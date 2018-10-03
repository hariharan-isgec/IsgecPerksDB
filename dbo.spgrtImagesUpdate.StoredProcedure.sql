USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtImagesUpdate]
  @Original_ImageID Int, 
  @Description NVarChar(50),
  @ImageFileName NVarChar(250),
  @DiskFileName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [GRT_Images] SET 
   [Description] = @Description
  ,[ImageFileName] = @ImageFileName
  ,[DiskFileName] = @DiskFileName
  WHERE
  [ImageID] = @Original_ImageID
  SET @RowCount = @@RowCount
GO
