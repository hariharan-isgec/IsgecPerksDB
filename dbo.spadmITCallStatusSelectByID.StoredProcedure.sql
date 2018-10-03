USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallStatusSelectByID]
  @CallStatusID NVarChar(20) 
  AS
  SELECT
		[ADM_ITCallStatus].[CallStatusID],
		[ADM_ITCallStatus].[Description] 
  FROM [ADM_ITCallStatus] 
  WHERE
  [ADM_ITCallStatus].[CallStatusID] = @CallStatusID
GO
