USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBDataSelectByID]
  @LoginID NVarChar(8),
  @DBDataID Int 
  AS
  SELECT
    [WF_DBData].*  
  FROM [WF_DBData] 
  WHERE
  [WF_DBData].[DBDataID] = @DBDataID
GO
