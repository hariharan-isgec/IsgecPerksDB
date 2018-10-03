USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmIGvsEGInsert]
  @InspectorGroupID Int,
  @EmployeeGroupID Int,
  @Return_InspectorGroupID Int = null OUTPUT, 
  @Return_EmployeeGroupID Int = null OUTPUT 
  AS
  INSERT [QCM_InspectorGroupEmployeeGroup]
  (
   [InspectorGroupID]
  ,[EmployeeGroupID]
  )
  VALUES
  (
   @InspectorGroupID
  ,@EmployeeGroupID
  )
  SET @Return_InspectorGroupID = @InspectorGroupID
  SET @Return_EmployeeGroupID = @EmployeeGroupID
GO
