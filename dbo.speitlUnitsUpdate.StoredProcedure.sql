USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlUnitsUpdate]
  @Original_UnitID NVarChar(3), 
  @UnitID NVarChar(3),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_Units] SET 
   [UnitID] = @UnitID
  ,[Description] = @Description
  WHERE
  [UnitID] = @Original_UnitID
  SET @RowCount = @@RowCount
GO
