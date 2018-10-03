USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptarTravelRequestStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [TA_TravelRequestStatus].*  
  FROM [TA_TravelRequestStatus] 
  WHERE
  [TA_TravelRequestStatus].[StatusID] = @StatusID
GO
