USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalPriorityInsert]
  @Priority NVarChar(1),
  @Description NVarChar(30),
  @Return_Priority NVarChar(1) = null OUTPUT
  AS
  INSERT [CAL_Priority]
  (
   [Priority]
  ,[Description]
  )
  VALUES
  (
   @Priority
  ,@Description
  )
  SET @Return_Priority = @Priority
GO
