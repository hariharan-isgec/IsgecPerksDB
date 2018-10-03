USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsInsert]
  @BloodGroupID NVarChar(5),
  @Description NVarChar(30),
  @Return_BloodGroupID NVarChar(5) = null OUTPUT
  AS
  INSERT [HRM_BloodGroups]
  (
   [BloodGroupID]
  ,[Description]
  )
  VALUES
  (
   @BloodGroupID
  ,@Description
  )
  SET @Return_BloodGroupID = @BloodGroupID
GO
