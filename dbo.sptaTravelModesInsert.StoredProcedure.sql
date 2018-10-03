USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelModesInsert]
  @ModeName NVarChar(50),
  @Sequence Int,
  @OutOfSequence Bit,
  @UnderMilageClaim Bit,
  @Return_ModeID Int = null OUTPUT 
  AS
  INSERT [TA_TravelModes]
  (
   [ModeName]
  ,[Sequence]
  ,[OutOfSequence]
  ,[UnderMilageClaim]
  )
  VALUES
  (
   @ModeName
  ,@Sequence
  ,@OutOfSequence
  ,@UnderMilageClaim
  )
  SET @Return_ModeID = Scope_Identity()
GO
