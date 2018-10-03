USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallSubTypesSelectByID]
  @LoginID NVarChar(8),
  @CallTypeID NVarChar(20),
  @CallSubTypeID Int 
  AS
  SELECT
		[ADM_ITCallSubTypes].[CallTypeID] ,
		[ADM_ITCallSubTypes].[CallSubTypeID] ,
		[ADM_ITCallSubTypes].[Description] ,
		[ADM_ITCallTypes1].[Description] AS ADM_ITCallTypes1_Description 
  FROM [ADM_ITCallSubTypes] 
  INNER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes1]
    ON [ADM_ITCallSubTypes].[CallTypeID] = [ADM_ITCallTypes1].[CallTypeID]
  WHERE
  [ADM_ITCallSubTypes].[CallTypeID] = @CallTypeID
  AND [ADM_ITCallSubTypes].[CallSubTypeID] = @CallSubTypeID
GO
