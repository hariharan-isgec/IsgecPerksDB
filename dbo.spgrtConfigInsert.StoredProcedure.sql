USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtConfigInsert]
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
  @Return_GreetingID Int = null OUTPUT 
  AS
  INSERT [GRT_Config]
  (
   [Description]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  ,[EnableDear]
  ,[DearText]
  ,[EnableGreetingText]
  ,[GreetingText]
  ,[EnableImage]
  ,[ImageID]
  ,[UseDefaultImageSize]
  ,[ImageHeight]
  ,[ImageWidth]
  ,[EnableBottomText]
  ,[BottomText]
  ,[EnableSignature]
  ,[IncludeDesignation]
  ,[IncludeDepartment]
  ,[IncludeDirectNo]
  ,[IncludeCellNo]
  )
  VALUES
  (
   @Description
  ,@FromDate
  ,@TillDate
  ,@Active
  ,@EnableDear
  ,@DearText
  ,@EnableGreetingText
  ,@GreetingText
  ,@EnableImage
  ,@ImageID
  ,@UseDefaultImageSize
  ,@ImageHeight
  ,@ImageWidth
  ,@EnableBottomText
  ,@BottomText
  ,@EnableSignature
  ,@IncludeDesignation
  ,@IncludeDepartment
  ,@IncludeDirectNo
  ,@IncludeCellNo
  )
  SET @Return_GreetingID = Scope_Identity()
GO
