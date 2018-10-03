USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkStatusInsert]
  @Description NVarChar(20),
  @StatusID Int = null OUTPUT
  AS
  INSERT [PRK_Status]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @StatusID = Scope_Identity()
GO
