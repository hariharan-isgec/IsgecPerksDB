USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPsInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(100),
  @Sequence Int,
  @DisplayType NVarChar(50),
  @engTaskID Int,
  @ordTaskID Int,
  @desTaskID Int,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_CLPID Int = null OUTPUT 
  AS
  INSERT [TOS_CLPs]
  (
   [ProjectID]
  ,[Description]
  ,[Sequence]
  ,[DisplayType]
  ,[engTaskID]
  ,[ordTaskID]
  ,[desTaskID]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  ,@Sequence
  ,@DisplayType
  ,@engTaskID
  ,@ordTaskID
  ,@desTaskID
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_CLPID = Scope_Identity()
GO
