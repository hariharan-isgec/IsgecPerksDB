USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchStatusInsert]
  @PunchStatusID NVarChar(2),
  @Description NVarChar(30),
  @PunchValue Decimal(6,2),
  @Return_PunchStatusID NVarChar(2) = null OUTPUT
  AS
  INSERT [ATN_PunchStatus]
  (
   [PunchStatusID]
  ,[Description]
  ,[PunchValue]
  )
  VALUES
  (
   @PunchStatusID
  ,@Description
  ,@PunchValue
  )
  SET @Return_PunchStatusID = @PunchStatusID
GO
