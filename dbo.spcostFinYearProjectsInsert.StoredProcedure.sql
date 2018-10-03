USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearProjectsInsert]
  @FinYear Int,
  @Quarter Int,
  @ProjectID NVarChar(6),
  @Descpription NVarChar(50),
  @IndividualGroup Bit,
  @CombinedGroup Bit,
  @IndividualGroupID Int,
  @CombinedGroupID Int,
  @Blocked Bit,
  @BlockingRemarks NVarChar(50),
  @EntryConfirmed Bit,
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT, 
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [COST_FinYearProjects]
  (
   [FinYear]
  ,[Quarter]
  ,[ProjectID]
  ,[Descpription]
  ,[IndividualGroup]
  ,[CombinedGroup]
  ,[IndividualGroupID]
  ,[CombinedGroupID]
  ,[Blocked]
  ,[BlockingRemarks]
  ,[EntryConfirmed]
  )
  VALUES
  (
   @FinYear
  ,@Quarter
  ,UPPER(@ProjectID)
  ,@Descpription
  ,@IndividualGroup
  ,@CombinedGroup
  ,@IndividualGroupID
  ,@CombinedGroupID
  ,@Blocked
  ,@BlockingRemarks
  ,@EntryConfirmed
  )
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
  SET @Return_ProjectID = @ProjectID
GO
