USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormStatusUpdate]
  @Original_FormStatusID NVarChar(30), 
  @FormStatusID NVarChar(30),
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMS_FormStatus] SET 
   [FormStatusID] = @FormStatusID
  ,[Description] = @Description
  WHERE
  [FormStatusID] = @Original_FormStatusID
  SET @RowCount = @@RowCount
GO
