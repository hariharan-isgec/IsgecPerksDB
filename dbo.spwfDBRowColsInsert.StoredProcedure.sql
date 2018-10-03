USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowColsInsert]
  @Description NVarChar(50),
  @DBFieldName NVarChar(50),
  @cssHeader NVarChar(50),
  @cssCell NVarChar(50),
  @Sequence Int,
  @DashboardID Int,
  @DBRows Int,
  @LinkURL NVarChar(500),
  @Return_DashboardID Int = null OUTPUT, 
  @Return_DBRows Int = null OUTPUT, 
  @Return_DBCols Int = null OUTPUT 
  AS
  INSERT [WF_DBRowCols]
  (
   [Description]
  ,[DBFieldName]
  ,[cssHeader]
  ,[cssCell]
  ,[Sequence]
  ,[DashboardID]
  ,[DBRows]
  ,[LinkURL]
  )
  VALUES
  (
   @Description
  ,@DBFieldName
  ,@cssHeader
  ,@cssCell
  ,@Sequence
  ,@DashboardID
  ,@DBRows
  ,@LinkURL
  )
  SET @Return_DashboardID = @DashboardID
  SET @Return_DBRows = @DBRows
  SET @Return_DBCols = Scope_Identity()
GO
