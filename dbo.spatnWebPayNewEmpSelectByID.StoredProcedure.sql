USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnWebPayNewEmpSelectByID]
  @LoginID NVarChar(8),
  @CardNo VarChar(10) 
  AS
  SELECT
    [ATN_WebPayNewEmp].*  
  FROM [ATN_WebPayNewEmp] 
  WHERE
  [ATN_WebPayNewEmp].[CardNo] = @CardNo
GO
