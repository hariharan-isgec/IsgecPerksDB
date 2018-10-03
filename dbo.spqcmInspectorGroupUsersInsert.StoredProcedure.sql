USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectorGroupUsersInsert]
  @GroupID Int,
  @CardNo NVarChar(8),
  @Return_GroupID Int = null OUTPUT, 
  @Return_CardNo NVarChar(8) = null OUTPUT 
  AS
  INSERT [QCM_InspectorGroupUsers]
  (
   [GroupID]
  ,[CardNo]
  )
  VALUES
  (
   @GroupID
  ,UPPER(@CardNo)
  )
  SET @Return_GroupID = @GroupID
  SET @Return_CardNo = @CardNo
GO
