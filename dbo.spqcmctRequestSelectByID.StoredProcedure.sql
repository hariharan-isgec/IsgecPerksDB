USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmctRequestSelectByID]
  @LoginID NVarChar(8),
  @QCRequestNo Int,
  @SerialNo Int,
  @PONumber NVarChar(9),
  @ItemReference VarChar(200),
  @ActivityID VarChar(9) 
  AS
  SELECT
    [QCM_CT_Request].* ,
    [QCM_InspectionStages1].[Description] AS QCM_InspectionStages1_Description 
  FROM [QCM_CT_Request] 
  LEFT OUTER JOIN [QCM_InspectionStages] AS [QCM_InspectionStages1]
    ON [QCM_CT_Request].[InspectionStageiD] = [QCM_InspectionStages1].[InspectionStageID]
  WHERE
  [QCM_CT_Request].[QCRequestNo] = @QCRequestNo
  AND [QCM_CT_Request].[SerialNo] = @SerialNo
GO
