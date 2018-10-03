USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDetailTypesUpdate]
  @Original_DetailTypeID NVarChar(6), 
  @DetailTypeID NVarChar(6),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMS_DetailTypes] SET 
   [DetailTypeID] = @DetailTypeID
  ,[Description] = @Description
  WHERE
  [DetailTypeID] = @Original_DetailTypeID
  SET @RowCount = @@RowCount
GO
