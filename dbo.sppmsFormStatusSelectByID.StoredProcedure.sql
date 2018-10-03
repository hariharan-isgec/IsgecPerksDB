USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormStatusSelectByID]
  @FormStatusID NVarChar(30) 
  AS
  SELECT
		[PMS_FormStatus].[FormStatusID] ,
		[PMS_FormStatus].[Description]  
  FROM [PMS_FormStatus] 
  WHERE
  [PMS_FormStatus].[FormStatusID] = @FormStatusID
GO
