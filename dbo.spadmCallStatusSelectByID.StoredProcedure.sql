USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallStatusSelectByID]
  @CallStatusID NVarChar(20) 
  AS
  SELECT
		[ADM_CallStatus].[CallStatusID],
		[ADM_CallStatus].[Description] 
  FROM [ADM_CallStatus] 
  WHERE
  [ADM_CallStatus].[CallStatusID] = @CallStatusID
GO
