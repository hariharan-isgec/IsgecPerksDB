USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowColsUpdate]
  @Original_DashboardID Int, 
  @Original_DBRows Int, 
  @Original_DBCols Int, 
  @Description NVarChar(50),
  @DBFieldName NVarChar(50),
  @cssHeader NVarChar(50),
  @cssCell NVarChar(50),
  @Sequence Int,
  @DashboardID Int,
  @DBRows Int,
  @LinkURL NVarChar(500),
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_DBRowCols] SET 
   [Description] = @Description
  ,[DBFieldName] = @DBFieldName
  ,[cssHeader] = @cssHeader
  ,[cssCell] = @cssCell
  ,[Sequence] = @Sequence
  ,[DashboardID] = @DashboardID
  ,[DBRows] = @DBRows
  ,[LinkURL] = @LinkURL
  WHERE
  [DashboardID] = @Original_DashboardID
  AND [DBRows] = @Original_DBRows
  AND [DBCols] = @Original_DBCols
  SET @RowCount = @@RowCount
GO
