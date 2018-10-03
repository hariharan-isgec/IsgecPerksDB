USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID NVarChar(2) 
  AS
  SELECT
    [SC_Status].*  
  FROM [SC_Status] 
  WHERE
  [SC_Status].[StatusID] = @StatusID
GO
