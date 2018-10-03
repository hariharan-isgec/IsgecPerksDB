USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [PRK_Status].*  
  FROM [PRK_Status] 
  WHERE
  [PRK_Status].[StatusID] = @StatusID
GO
