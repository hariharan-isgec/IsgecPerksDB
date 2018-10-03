USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaLCModesInsert]
  @ModeName NVarChar(50),
  @OutOfSequence Bit,
  @Sequence Int,
  @UnderMilageClaim Bit,
  @Return_ModeID Int = null OUTPUT 
  AS
  INSERT [TA_LCModes]
  (
   [ModeName]
  ,[OutOfSequence]
  ,[Sequence]
  ,[UnderMilageClaim]
  )
  VALUES
  (
   @ModeName
  ,@OutOfSequence
  ,@Sequence
  ,@UnderMilageClaim
  )
  SET @Return_ModeID = Scope_Identity()
GO
