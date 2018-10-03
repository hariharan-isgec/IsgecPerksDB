USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosFunctionalAreaInsert]
  @FunctionalAreaID NVarChar(6),
  @Description NVarChar(50),
  @Return_FunctionalAreaID NVarChar(6) = null OUTPUT 
  AS
  INSERT [TOS_FunctionalArea]
  (
   [FunctionalAreaID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@FunctionalAreaID)
  ,@Description
  )
  SET @Return_FunctionalAreaID = @FunctionalAreaID
GO
