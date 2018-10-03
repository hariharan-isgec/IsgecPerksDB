USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDetailViewTypesUpdate]
  @Original_DVTypeID Int, 
  @DVTypeDescription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_DetailViewTypes] SET 
   [DVTypeDescription] = @DVTypeDescription
  WHERE
  [DVTypeID] = @Original_DVTypeID
  SET @RowCount = @@RowCount
GO
