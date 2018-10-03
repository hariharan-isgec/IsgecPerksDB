USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectTypesSelectByID]
  @LoginID NVarChar(8),
  @ProjectTypeID NVarChar(10) 
  AS
  SELECT
    [COST_ProjectTypes].*  
  FROM [COST_ProjectTypes] 
  WHERE
  [COST_ProjectTypes].[ProjectTypeID] = @ProjectTypeID
GO
