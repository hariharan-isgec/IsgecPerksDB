USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnShortLeaveAvailedSelectByID]
  @LoginID NVarChar(8),
  @AttenID Int 
  AS
  SELECT
		[ATNv_ShortLeaveAvailed].[AttenID] ,
		[ATNv_ShortLeaveAvailed].[AttenDate] ,
		[ATNv_ShortLeaveAvailed].[CardNo] ,
		[ATNv_ShortLeaveAvailed].[Punch1Time] ,
		[ATNv_ShortLeaveAvailed].[Punch2Time] ,
		[ATNv_ShortLeaveAvailed].[p1t] ,
		[ATNv_ShortLeaveAvailed].[p2t] ,
		[ATNv_ShortLeaveAvailed].[difmin] ,
		[ATNv_ShortLeaveAvailed].[EmployeeName] ,
		[ATNv_ShortLeaveAvailed].[Designation] ,
		[ATNv_ShortLeaveAvailed].[Department] ,
		[ATNv_ShortLeaveAvailed].[Division] ,
		[ATNv_ShortLeaveAvailed].[Location]  
  FROM [ATNv_ShortLeaveAvailed] 
  WHERE
  [ATNv_ShortLeaveAvailed].[AttenID] = @AttenID
GO
