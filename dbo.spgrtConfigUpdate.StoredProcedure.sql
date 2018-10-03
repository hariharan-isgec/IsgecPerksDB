USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtConfigUpdate]
  @Original_GreetingID Int, 
  @Description NVarChar(50),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @EnableDear Bit,
  @DearText NVarChar(100),
  @EnableGreetingText Bit,
  @GreetingText NVarChar(500),
  @EnableImage Bit,
  @ImageID Int,
  @UseDefaultImageSize Bit,
  @ImageHeight Int,
  @ImageWidth Int,
  @EnableBottomText Bit,
  @BottomText NVarChar(500),
  @EnableSignature Bit,
  @IncludeDesignation Bit,
  @IncludeDepartment Bit,
  @IncludeDirectNo Bit,
  @IncludeCellNo Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [GRT_Config] SET 
   [Description] = @Description
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  ,[EnableDear] = @EnableDear
  ,[DearText] = @DearText
  ,[EnableGreetingText] = @EnableGreetingText
  ,[GreetingText] = @GreetingText
  ,[EnableImage] = @EnableImage
  ,[ImageID] = @ImageID
  ,[UseDefaultImageSize] = @UseDefaultImageSize
  ,[ImageHeight] = @ImageHeight
  ,[ImageWidth] = @ImageWidth
  ,[EnableBottomText] = @EnableBottomText
  ,[BottomText] = @BottomText
  ,[EnableSignature] = @EnableSignature
  ,[IncludeDesignation] = @IncludeDesignation
  ,[IncludeDepartment] = @IncludeDepartment
  ,[IncludeDirectNo] = @IncludeDirectNo
  ,[IncludeCellNo] = @IncludeCellNo
  WHERE
  [GreetingID] = @Original_GreetingID
  SET @RowCount = @@RowCount
GO
