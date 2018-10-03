USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQualificationsInsert]
  @Description NVarChar(50),
  @Return_QualificationID Int = null OUTPUT
  AS
  INSERT [HRM_Qualifications]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_QualificationID = Scope_Identity()
GO
