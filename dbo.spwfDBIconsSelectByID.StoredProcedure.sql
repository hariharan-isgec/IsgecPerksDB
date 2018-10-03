USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBIconsSelectByID]
  @LoginID NVarChar(8),
  @DBIconID Int 
  AS
  SELECT
    [WF_DBIcons].*  
  FROM [WF_DBIcons] 
  WHERE
  [WF_DBIcons].[DBIconID] = @DBIconID
GO
