USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillTypesUpdate]
  @Original_BillTypeID Int, 
  @BillTypeID Int,
  @Description VarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_DetentionBillTypes] SET 
   [BillTypeID] = @BillTypeID
  ,[Description] = @Description
  WHERE
  [BillTypeID] = @Original_BillTypeID
  SET @RowCount = @@RowCount
GO
