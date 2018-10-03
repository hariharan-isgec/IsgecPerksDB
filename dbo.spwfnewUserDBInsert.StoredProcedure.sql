USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfnewUserDBInsert]
  @UserID NVarChar(8),
  @DashboardID Int,
  @DBRows Int,
  @Sequence Decimal(8,3),
  @DataSource NVarChar(10),
  @IsLeft Bit,
  @AppName_Left NVarChar(100),
  @vTOTSQLl NVarChar(4000),
  @vREDSQLl NVarChar(4000),
  @vAMBSQLl NVarChar(4000),
  @vGRESQLl NVarChar(4000),
  @IsRight Bit,
  @AppName_Right NVarChar(100),
  @vTOTSQLr NVarChar(4000),
  @vREDSQLr NVarChar(4000),
  @vAMBSQLr NVarChar(4000),
  @vGRESQLr NVarChar(4000),
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_DashboardID Int = null OUTPUT, 
  @Return_DBRows Int = null OUTPUT 
  AS
  INSERT [WF_newUserDB]
  (
   [UserID]
  ,[DashboardID]
  ,[DBRows]
  ,[Sequence]
  ,[DataSource]
  ,[IsLeft]
  ,[AppName_Left]
  ,[vTOTSQLl]
  ,[vREDSQLl]
  ,[vAMBSQLl]
  ,[vGRESQLl]
  ,[IsRight]
  ,[AppName_Right]
  ,[vTOTSQLr]
  ,[vREDSQLr]
  ,[vAMBSQLr]
  ,[vGRESQLr]
  )
  VALUES
  (
   UPPER(@UserID)
  ,@DashboardID
  ,@DBRows
  ,@Sequence
  ,@DataSource
  ,@IsLeft
  ,@AppName_Left
  ,@vTOTSQLl
  ,@vREDSQLl
  ,@vAMBSQLl
  ,@vGRESQLl
  ,@IsRight
  ,@AppName_Right
  ,@vTOTSQLr
  ,@vREDSQLr
  ,@vAMBSQLr
  ,@vGRESQLr
  )
  SET @Return_UserID = @UserID
  SET @Return_DashboardID = @DashboardID
  SET @Return_DBRows = @DBRows
GO
