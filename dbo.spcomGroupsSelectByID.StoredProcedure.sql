USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupsSelectByID]
  @LoginID NVarChar(8),
  @GroupID NVarChar(6) 
  AS
  SELECT
    [SYS_Groups].*  
  FROM [SYS_Groups] 
  WHERE
  [SYS_Groups].[GroupID] = @GroupID
GO
