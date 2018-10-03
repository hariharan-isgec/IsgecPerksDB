USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfStatusSelectByID]
  @LoginID NVarChar(8),
  @PSFStatus Int 
  AS
  SELECT
    [PSF_Status].*  
  FROM [PSF_Status] 
  WHERE
  [PSF_Status].[PSFStatus] = @PSFStatus
GO
