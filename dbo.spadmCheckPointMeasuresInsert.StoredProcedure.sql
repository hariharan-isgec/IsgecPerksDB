USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCheckPointMeasuresInsert]
  @CheckPointID Int,
  @MeasureID Int,
  @Return_CheckPointID Int = null OUTPUT
  AS
  INSERT [ADM_CheckPointMeasures]
  (
   [CheckPointID]
  ,[MeasureID]
  )
  VALUES
  (
   @CheckPointID
  ,@MeasureID
  )
  SET @Return_CheckPointID = @CheckPointID
GO
