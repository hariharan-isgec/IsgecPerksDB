USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spvrVTDefaultInsert]
  @MinimumCapacityPercentage Decimal(6,2),
  @MaximumCapacityPercentage Decimal(6,2),
  @MinimumHeightPercentage Decimal(6,2),
  @MinimumWidthPercentage Decimal(6,2),
  @MinimumLengthPercentage Decimal(6,2),
  @MaximumHeightPercentage Decimal(6,2),
  @MaximumWidthPercentage Decimal(6,2),
  @MaximumLengthPercentage Decimal(6,2),
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [VR_VTDefault]
  (
   [MinimumCapacityPercentage]
  ,[MaximumCapacityPercentage]
  ,[MinimumHeightPercentage]
  ,[MinimumWidthPercentage]
  ,[MinimumLengthPercentage]
  ,[MaximumHeightPercentage]
  ,[MaximumWidthPercentage]
  ,[MaximumLengthPercentage]
  )
  VALUES
  (
   @MinimumCapacityPercentage
  ,@MaximumCapacityPercentage
  ,@MinimumHeightPercentage
  ,@MinimumWidthPercentage
  ,@MinimumLengthPercentage
  ,@MaximumHeightPercentage
  ,@MaximumWidthPercentage
  ,@MaximumLengthPercentage
  )
  SET @Return_SerialNo = Scope_Identity()
GO
