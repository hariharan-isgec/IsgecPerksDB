USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfnewUserDBUpdate]
  @Original_UserID NVarChar(8), 
  @Original_DashboardID Int, 
  @Original_DBRows Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_newUserDB] SET 
   [UserID] = @UserID
  ,[DashboardID] = @DashboardID
  ,[DBRows] = @DBRows
  ,[Sequence] = @Sequence
  ,[DataSource] = @DataSource
  ,[IsLeft] = @IsLeft
  ,[AppName_Left] = @AppName_Left
  ,[vTOTSQLl] = @vTOTSQLl
  ,[vREDSQLl] = @vREDSQLl
  ,[vAMBSQLl] = @vAMBSQLl
  ,[vGRESQLl] = @vGRESQLl
  ,[IsRight] = @IsRight
  ,[AppName_Right] = @AppName_Right
  ,[vTOTSQLr] = @vTOTSQLr
  ,[vREDSQLr] = @vREDSQLr
  ,[vAMBSQLr] = @vAMBSQLr
  ,[vGRESQLr] = @vGRESQLr
  WHERE
  [UserID] = @Original_UserID
  AND [DashboardID] = @Original_DashboardID
  AND [DBRows] = @Original_DBRows
  SET @RowCount = @@RowCount
GO
