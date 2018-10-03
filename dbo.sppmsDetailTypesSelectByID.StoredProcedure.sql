USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDetailTypesSelectByID]
  @DetailTypeID NVarChar(6) 
  AS
  SELECT
		[PMS_DetailTypes].[DetailTypeID] ,
		[PMS_DetailTypes].[Description]  
  FROM [PMS_DetailTypes] 
  WHERE
  [PMS_DetailTypes].[DetailTypeID] = @DetailTypeID
GO
