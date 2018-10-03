USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowTypesUpdate]
  @Original_RowTypeID Int, 
  @Description NVarChar(50),
  @cssClass NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_DBRowTypes] SET 
   [Description] = @Description
  ,[cssClass] = @cssClass
  WHERE
  [RowTypeID] = @Original_RowTypeID
  SET @RowCount = @@RowCount
GO
