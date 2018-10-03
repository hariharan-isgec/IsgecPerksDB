USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowTypesSelectByID]
  @LoginID NVarChar(8),
  @RowTypeID Int 
  AS
  SELECT
    [WF_DBRowTypes].*  
  FROM [WF_DBRowTypes] 
  WHERE
  [WF_DBRowTypes].[RowTypeID] = @RowTypeID
GO
