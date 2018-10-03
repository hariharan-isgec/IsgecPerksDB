USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupsInsert]
  @GroupID NVarChar(6),
  @Description NVarChar(50),
  @Active Bit,
  @Return_GroupID NVarChar(6) = null OUTPUT 
  AS
  INSERT [SYS_Groups]
  (
   [GroupID]
  ,[Description]
  ,[Active]
  )
  VALUES
  (
   UPPER(@GroupID)
  ,@Description
  ,@Active
  )
  SET @Return_GroupID = @GroupID
GO
