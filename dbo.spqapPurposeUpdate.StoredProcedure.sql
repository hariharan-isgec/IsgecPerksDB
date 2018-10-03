USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapPurposeUpdate]
  @Original_PurposeID Int, 
  @PurposeName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QAP_Purpose] SET 
   [PurposeName] = @PurposeName
  WHERE
  [PurposeID] = @Original_PurposeID
  SET @RowCount = @@RowCount
GO
