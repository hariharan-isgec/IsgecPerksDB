USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmOriginatorUpdate]
  @Original_OriginatorID NVarChar(3), 
  @OriginatorID NVarChar(3),
  @Description NVarChar(30),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_Originator] SET 
   [OriginatorID] = @OriginatorID
  ,[Description] = @Description
  WHERE
  [OriginatorID] = @Original_OriginatorID
  SET @RowCount = @@RowCount
GO
