USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaComponentsSelectByID]
  @LoginID NVarChar(8),
  @ComponentID Int 
  AS
  SELECT
		[TA_Components].[ComponentID] ,
		[TA_Components].[Description]  
  FROM [TA_Components] 
  WHERE
  [TA_Components].[ComponentID] = @ComponentID
GO
