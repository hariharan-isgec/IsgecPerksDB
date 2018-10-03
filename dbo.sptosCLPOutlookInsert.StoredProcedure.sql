USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPOutlookInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(50),
  @AsOn DateTime,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @Active Bit,
  @DueByDays Int,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_ProgressID Int = null OUTPUT 
  AS
  INSERT [TOS_CLPData]
  (
   [ProjectID]
  ,[Description]
  ,[AsOn]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[Active]
  ,[DueByDays]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  ,@AsOn
  ,@CreatedBy
  ,@CreatedOn
  ,@Active
  ,@DueByDays
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_ProgressID = Scope_Identity()
GO
