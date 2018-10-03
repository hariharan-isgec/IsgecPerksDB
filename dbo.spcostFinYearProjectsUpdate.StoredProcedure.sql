USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearProjectsUpdate]
  @Original_FinYear Int, 
  @Original_Quarter Int, 
  @Original_ProjectID NVarChar(6), 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_FinYearProjects] SET 
   [FinYear] = @FinYear
  ,[Quarter] = @Quarter
  ,[ProjectID] = @ProjectID
  ,[Descpription] = @Descpription
  ,[IndividualGroup] = @IndividualGroup
  ,[CombinedGroup] = @CombinedGroup
  ,[IndividualGroupID] = @IndividualGroupID
  ,[CombinedGroupID] = @CombinedGroupID
  ,[Blocked] = @Blocked
  ,[BlockingRemarks] = @BlockingRemarks
  ,[EntryConfirmed] = @EntryConfirmed
  WHERE
  [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  AND [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO
