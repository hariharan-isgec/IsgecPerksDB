USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskTypesInsert]
  @TaskTypeID NVarChar(2),
  @Description NVarChar(30),
  @Return_TaskTypeID NVarChar(2) = null OUTPUT 
  AS
  INSERT [TOS_TaskTypes]
  (
   [TaskTypeID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@TaskTypeID)
  ,@Description
  )
  SET @Return_TaskTypeID = @TaskTypeID
GO
