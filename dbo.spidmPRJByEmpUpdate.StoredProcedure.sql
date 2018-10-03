USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmPRJByEmpUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_CardNo NVarChar(8), 
  @ProjectID NVarChar(6),
  @CardNo NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_ProjectsByEmployee] SET 
   [ProjectID] = @ProjectID
  ,[CardNo] = @CardNo
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO
