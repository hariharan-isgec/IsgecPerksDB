USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPStatesInsert]
  @StateID NVarChar(2),
  @Description NVarChar(50),
  @ISGECCentralGSTGL NVarChar(7) = NULL,
  @ISGECStateGSTGL NVarChar(7) = NULL,
  @Return_StateID NVarChar(2) = null OUTPUT 
  AS
  INSERT [SPMT_ERPStates]
  (
   [StateID]
  ,[Description]
  ,[ISGECCentralGSTGL]
  ,[ISGECStateGSTGL]
  )
  VALUES
  (
   UPPER(@StateID)
  ,@Description
  ,@ISGECCentralGSTGL
  ,@ISGECStateGSTGL
  )
  SET @Return_StateID = @StateID
GO
