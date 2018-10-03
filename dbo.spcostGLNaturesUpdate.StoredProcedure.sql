USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLNaturesUpdate]
  @Original_GLNatureID Int, 
  @GLNatureDescription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_GLNatures] SET 
   [GLNatureDescription] = @GLNatureDescription
  WHERE
  [GLNatureID] = @Original_GLNatureID
  SET @RowCount = @@RowCount
GO
