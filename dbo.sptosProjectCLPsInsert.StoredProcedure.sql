USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosProjectCLPsInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(250),
  @Quantity NVarChar(100),
  @Sequence Int,
  @DisplayType NVarChar(50),
  @engTaskID Int,
  @ordTaskID Int,
  @desTaskID Int,
  @ereTaskID Int,
  @ioTaskID Int,
  @recTaskID Int,
  @ad1TaskID Int,
  @ad2TaskID Int,
  @ad3TaskID Int,
  @ad4TaskID Int,
  @Active Bit,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_CLPID Int = null OUTPUT 
  AS
  INSERT [TOS_CLPs]
  (
   [ProjectID]
  ,[Description]
  ,[Quantity]
  ,[Sequence]
  ,[DisplayType]
  ,[engTaskID]
  ,[ordTaskID]
  ,[desTaskID]
  ,[ereTaskID]
  ,[ioTaskID]
  ,[recTaskID]
  ,[ad1TaskID]
  ,[ad2TaskID]
  ,[ad3TaskID]
  ,[ad4TaskID]
  ,[Active]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  ,@Quantity
  ,@Sequence
  ,@DisplayType
  ,@engTaskID
  ,@ordTaskID
  ,@desTaskID
  ,@ereTaskID
  ,@ioTaskID
  ,@recTaskID
  ,@ad1TaskID
  ,@ad2TaskID
  ,@ad3TaskID
  ,@ad4TaskID
  ,@Active
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_CLPID = Scope_Identity()
GO
