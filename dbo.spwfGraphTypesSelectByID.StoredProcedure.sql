USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfGraphTypesSelectByID]
  @LoginID NVarChar(8),
  @GraphTypeID Int 
  AS
  SELECT
    [WF_GraphTypes].*  
  FROM [WF_GraphTypes] 
  WHERE
  [WF_GraphTypes].[GraphTypeID] = @GraphTypeID
GO
