USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spatn_LG_EmployeesCardNoSelectList]
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[HRM_Employees].[CardNo] 
  FROM [HRM_Employees] 
  WHERE [HRM_Employees].[ActiveState] = @ActiveState  
  ORDER BY cardno 

  SET @RecordCount = @@RowCount
GO
