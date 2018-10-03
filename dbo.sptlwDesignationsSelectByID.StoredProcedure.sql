USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwDesignationsSelectByID]
  @LoginID NVarChar(8),
  @DesignationID Int 
  AS
  SELECT
    [HRM_Designations].*  
  FROM [HRM_Designations] 
  WHERE
  [HRM_Designations].[DesignationID] = @DesignationID
GO
