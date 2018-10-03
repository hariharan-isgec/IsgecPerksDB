USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkTable1GetByID]
  @CardNo Int
  AS
  SELECT
		* 
  FROM [NPRK_Table1] 
  WHERE
  [NPRK_Table1].[CardNo] = @CardNo

Return @@RowCount
GO
