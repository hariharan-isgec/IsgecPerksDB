USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtConfigSelectByID]
  @LoginID NVarChar(8),
  @GreetingID Int 
  AS
  SELECT
		[GRT_Config].[GreetingID] ,
		[GRT_Config].[Description] ,
		[GRT_Config].[FromDate] ,
		[GRT_Config].[TillDate] ,
		[GRT_Config].[Active] ,
		[GRT_Config].[EnableDear] ,
		[GRT_Config].[DearText] ,
		[GRT_Config].[EnableGreetingText] ,
		[GRT_Config].[GreetingText] ,
		[GRT_Config].[EnableImage] ,
		[GRT_Config].[ImageID] ,
		[GRT_Config].[UseDefaultImageSize] ,
		[GRT_Config].[ImageHeight] ,
		[GRT_Config].[ImageWidth] ,
		[GRT_Config].[EnableBottomText] ,
		[GRT_Config].[BottomText] ,
		[GRT_Config].[EnableSignature] ,
		[GRT_Config].[IncludeDesignation] ,
		[GRT_Config].[IncludeDepartment] ,
		[GRT_Config].[IncludeDirectNo] ,
		[GRT_Config].[IncludeCellNo] ,
		[GRT_Images1].[Description] AS GRT_Images1_Description 
  FROM [GRT_Config] 
  LEFT OUTER JOIN [GRT_Images] AS [GRT_Images1]
    ON [GRT_Config].[ImageID] = [GRT_Images1].[ImageID]
  WHERE
  [GRT_Config].[GreetingID] = @GreetingID
GO
