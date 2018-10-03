USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnShortLeaveCompensatedSelectByID]
  @LoginID NVarChar(8),
  @AttenID Int 
  AS
  SELECT
		[ATNv_ShortLeaveCompensated].[AttenID] ,
		[ATNv_ShortLeaveCompensated].[CardNo] ,
		[ATNv_ShortLeaveCompensated].[AttenDate] ,
		[ATNv_ShortLeaveCompensated].[Punch1Time] ,
		[ATNv_ShortLeaveCompensated].[Punch2Time] ,
		[ATNv_ShortLeaveCompensated].[p1t] ,
		[ATNv_ShortLeaveCompensated].[p2t] ,
		[ATNv_ShortLeaveCompensated].[difmin]  
  FROM [ATNv_ShortLeaveCompensated] 
  WHERE
  [ATNv_ShortLeaveCompensated].[AttenID] = @AttenID
GO
