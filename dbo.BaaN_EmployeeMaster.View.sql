USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[BaaN_EmployeeMaster]
as
SELECT 
				EmployeeCode,
				EmployeeName
FROM 
OPENQUERY([BAAN],
'SELECT 
				t$emno as EmployeeCode,
				t$nama as EmployeeName
FROM ttccom001100
');
GO
