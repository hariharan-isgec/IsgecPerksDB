USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmEMailGroupsInsert]
  @EMailGroup NVarChar(50),
  @Description NVarChar(50),
  @Return_EMailGroup NVarChar(50) = null OUTPUT
  AS
  INSERT [HRM_EMailGroups]
  (
   [EMailGroup]
  ,[Description]
  )
  VALUES
  (
   @EMailGroup
  ,@Description
  )
  SET @Return_EMailGroup = @EMailGroup
GO
