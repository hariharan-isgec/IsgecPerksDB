USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtForexTypesSelectByID]
  @FOREXTypeID NVarChar(20) 
  AS
  SELECT
		[SPMT_ForexTypes].[FOREXTypeID] ,
		[SPMT_ForexTypes].[Description]  
  FROM [SPMT_ForexTypes] 
  WHERE
  [SPMT_ForexTypes].[FOREXTypeID] = @FOREXTypeID
GO
