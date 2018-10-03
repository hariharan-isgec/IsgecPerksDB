USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStatusSelectByID]
  @LoginID NVarChar(8),
  @InspectionStatusID Int 
  AS
  SELECT
		[QCM_InspectionStatus].[InspectionStatusID] ,
		[QCM_InspectionStatus].[Description]  
  FROM [QCM_InspectionStatus] 
  WHERE
  [QCM_InspectionStatus].[InspectionStatusID] = @InspectionStatusID
GO
