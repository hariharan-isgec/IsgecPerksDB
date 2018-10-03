USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormStatusInsert]
  @FormStatusID NVarChar(30),
  @Description NVarChar(50),
  @Return_FormStatusID NVarChar(30) = null OUTPUT 
  AS
  INSERT [PMS_FormStatus]
  (
   [FormStatusID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@FormStatusID)
  ,@Description
  )
  SET @Return_FormStatusID = @FormStatusID
GO
