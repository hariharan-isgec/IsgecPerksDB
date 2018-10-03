USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusInsert]
  @StatusID NVarChar(2),
  @Description NVarChar(30),
  @Sequence Int,
  @Return_StatusID NVarChar(2) = null OUTPUT
  AS
  INSERT [HRM_Status]
  (
   [StatusID]
  ,[Description]
  ,[Sequence]
  )
  VALUES
  (
   @StatusID
  ,@Description
  ,@Sequence
  )
  SET @Return_StatusID = @StatusID
GO
