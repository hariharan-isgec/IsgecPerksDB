USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwLGPageSizeSelectByID]
  @LoginID NVarChar(8),
  @PageID Int 
  AS
  SELECT
    [SYS_LGPageSize].* ,
    [SYS_Applications1].[Description] AS SYS_Applications1_Description 
  FROM [SYS_LGPageSize] 
  INNER JOIN [SYS_Applications] AS [SYS_Applications1]
    ON [SYS_LGPageSize].[ApplicationID] = [SYS_Applications1].[ApplicationID]
  WHERE
  [SYS_LGPageSize].[PageID] = @PageID
GO
