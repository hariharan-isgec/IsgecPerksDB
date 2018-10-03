USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaDivisionsUpdate]
  @Original_DivisionID NVarChar(6), 
  @DivisionID NVarChar(6),
  @Description NVarChar(50),
  @DivisionHead NVarChar(8),
  @ERP_EU NVarChar(10),
  @ERP_Div NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_Divisions] SET 
   [DivisionID] = @DivisionID
  ,[Description] = @Description
  ,[DivisionHead] = @DivisionHead
  ,[ERP_EU] = @ERP_EU
  ,[ERP_Div] = @ERP_Div
  WHERE
  [DivisionID] = @Original_DivisionID
  SET @RowCount = @@RowCount
GO
