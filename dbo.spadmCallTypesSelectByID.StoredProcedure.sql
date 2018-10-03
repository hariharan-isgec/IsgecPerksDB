USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallTypesSelectByID]
  @CallTypeID NVarChar(20) 
  AS
  SELECT
		[ADM_CallTypes].[CallTypeID],
		[ADM_CallTypes].[Description] 
  FROM [ADM_CallTypes] 
  WHERE
  [ADM_CallTypes].[CallTypeID] = @CallTypeID
GO
