USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalStatusInsert]
  @Description NVarChar(30),
  @Return_CallStatusID Int = null OUTPUT
  AS
  INSERT [CAL_Status]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_CallStatusID = Scope_Identity()
GO
