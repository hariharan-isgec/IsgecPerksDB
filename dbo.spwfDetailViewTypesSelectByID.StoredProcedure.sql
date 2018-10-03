USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDetailViewTypesSelectByID]
  @LoginID NVarChar(8),
  @DVTypeID Int 
  AS
  SELECT
    [WF_DetailViewTypes].*  
  FROM [WF_DetailViewTypes] 
  WHERE
  [WF_DetailViewTypes].[DVTypeID] = @DVTypeID
GO
