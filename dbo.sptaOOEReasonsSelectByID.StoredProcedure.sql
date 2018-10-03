USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaOOEReasonsSelectByID]
  @LoginID NVarChar(8),
  @ReasonID Int 
  AS
  SELECT
		[TA_OOEReasons].[ReasonID] ,
		[TA_OOEReasons].[Description]  
  FROM [TA_OOEReasons] 
  WHERE
  [TA_OOEReasons].[ReasonID] = @ReasonID
GO
