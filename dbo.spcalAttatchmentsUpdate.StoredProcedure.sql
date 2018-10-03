USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalAttatchmentsUpdate]
  @Original_CallID Int, 
  @Original_SerialNo Int, 
  @CallID Int,
  @AttatchmentName NVarChar(250),
  @DiskFileName NVarChar(50),
  @IsImage Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [CAL_Attatchments] SET 
   [CallID] = @CallID
  ,[AttatchmentName] = @AttatchmentName
  ,[DiskFileName] = @DiskFileName
  ,[IsImage] = @IsImage
  WHERE
  [CallID] = @Original_CallID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
