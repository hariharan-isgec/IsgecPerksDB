USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillStatusInsert]
  @StatusID Int,
  @Description NVarChar(50),
  @Return_StatusID Int = null OUTPUT 
  AS
  INSERT [ELOG_DetentionBillStatus]
  (
   [StatusID]
  ,[Description]
  )
  VALUES
  (
   @StatusID
  ,@Description
  )
  SET @Return_StatusID = @StatusID
GO
