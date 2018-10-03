USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDetailViewTypesDelete]
  @Original_DVTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_DetailViewTypes]
  WHERE
  [WF_DetailViewTypes].[DVTypeID] = @Original_DVTypeID
  SET @RowCount = @@RowCount
GO
