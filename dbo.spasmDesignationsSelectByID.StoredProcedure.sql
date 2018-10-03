USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmDesignationsSelectByID]
  @DesignationID Int 
  AS
  SELECT
		[HRM_Designations].[DesignationID],
		[HRM_Designations].[Description],
		[HRM_Designations].[ShortName],
		[HRM_Designations].[Sequence] 
  FROM [HRM_Designations] 
  WHERE
  [HRM_Designations].[DesignationID] = @DesignationID
GO
