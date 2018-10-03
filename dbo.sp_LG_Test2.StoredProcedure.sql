USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LG_Test2]
  @prefix NVarChar(30),
  @records Int,
  @bycode Int  
  AS  
	--set rowcount @records
  IF (@bycode=1) 
	SELECT TOP (@records) [PRK_Employees].[EmployeeName]+' ['+[PRK_Employees].[CardNo]+']' FROM [PRK_Employees] WHERE LOWER(EMPLOYEENAME) LIKE LOWER(@PREFIX)+'%'
  ELSE 
	SELECT TOP (@records) [PRK_Employees].[CardNo]+' ['+ [PRK_Employees].[EmployeeName]+']' FROM [PRK_Employees] WHERE CARDNO >= @PREFIX 
	
	--set rowcount 0
GO
