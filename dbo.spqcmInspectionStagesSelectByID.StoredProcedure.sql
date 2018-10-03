USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStagesSelectByID]
  @LoginID NVarChar(8),
  @InspectionStageID Int 
  AS
  SELECT
		[QCM_InspectionStages].[InspectionStageID] ,
		[QCM_InspectionStages].[Description]  
  FROM [QCM_InspectionStages] 
  WHERE
  [QCM_InspectionStages].[InspectionStageID] = @InspectionStageID
GO
