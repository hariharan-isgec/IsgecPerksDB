USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallTypesSelectByID]
  @CallTypeID NVarChar(20) 
  AS
  SELECT
		[ADM_ITCallTypes].[CallTypeID],
		[ADM_ITCallTypes].[Description] 
  FROM [ADM_ITCallTypes] 
  WHERE
  [ADM_ITCallTypes].[CallTypeID] = @CallTypeID
GO
