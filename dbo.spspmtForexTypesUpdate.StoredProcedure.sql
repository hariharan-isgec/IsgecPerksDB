USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtForexTypesUpdate]
  @Original_FOREXTypeID NVarChar(20), 
  @FOREXTypeID NVarChar(20),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_ForexTypes] SET 
   [FOREXTypeID] = @FOREXTypeID
  ,[Description] = @Description
  WHERE
  [FOREXTypeID] = @Original_FOREXTypeID
  SET @RowCount = @@RowCount
GO
