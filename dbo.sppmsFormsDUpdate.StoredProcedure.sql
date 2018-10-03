USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsDUpdate]
  @Original_FinYear NVarChar(4), 
  @Original_CardNo NVarChar(8), 
  @Original_SrNo Int, 
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @KRA NVarChar(500),
  @KPI NVarChar(1000),
  @Competancy NVarChar(500),
  @DetailTypeID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMS_FormsD] SET 
   [FinYear] = @FinYear
  ,[CardNo] = @CardNo
  ,[KRA] = @KRA
  ,[KPI] = @KPI
  ,[Competancy] = @Competancy
  ,[DetailTypeID] = @DetailTypeID
  WHERE
  [FinYear] = @Original_FinYear
  AND [CardNo] = @Original_CardNo
  AND [SrNo] = @Original_SrNo
  SET @RowCount = @@RowCount
GO
