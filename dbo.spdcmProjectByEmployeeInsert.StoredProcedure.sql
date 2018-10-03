USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectByEmployeeInsert]
  @CardNo NVarChar(8),
  @ProjectID NVarChar(6),
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [DCM_ProjectByEmployee]
  (
   [CardNo]
  ,[ProjectID]
  )
  VALUES
  (
   @CardNo
  ,@ProjectID
  )
  SET @Return_RecordID = Scope_Identity()
GO
