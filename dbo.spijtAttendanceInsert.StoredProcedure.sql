USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spijtAttendanceInsert]
  @CardNo NVarChar(8),
  @DataMonth Int,
  @FinYear NVarChar(4),
  @ProjectID NVarChar(6),
  @Return_RecordID Int = null OUTPUT
  AS
  INSERT [IJT_Attendance]
  (
   [CardNo]
  ,[DataMonth]
  ,[FinYear]
  ,[ProjectID]
  )
  VALUES
  (
   @CardNo
  ,@DataMonth
  ,@FinYear
  ,@ProjectID
  )
  SET @Return_RecordID = Scope_Identity()
GO
