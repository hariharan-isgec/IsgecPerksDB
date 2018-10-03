USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtImagesSelectByID]
  @LoginID NVarChar(8),
  @ImageID Int 
  AS
  SELECT
		[GRT_Images].[ImageID] ,
		[GRT_Images].[Description] ,
		[GRT_Images].[ImageFileName] ,
		[GRT_Images].[DiskFileName]  
  FROM [GRT_Images] 
  WHERE
  [GRT_Images].[ImageID] = @ImageID
GO
