USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskTypesSelectByID]
  @TaskTypeID NVarChar(2) 
  AS
  SELECT
		[TOS_TaskTypes].[TaskTypeID] ,
		[TOS_TaskTypes].[Description]  
  FROM [TOS_TaskTypes] 
  WHERE
  [TOS_TaskTypes].[TaskTypeID] = @TaskTypeID
GO
