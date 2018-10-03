USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentListUpdate]
  @Original_SerialNo Int, 
  @Original_DocumentLineNo Int, 
  @SerialNo Int,
  @DocumentID NVarChar(50),
  @RevisionNo NVarChar(3),
  @Description NVarChar(200),
  @ReadyToDespatch Bit,
  @Despatched Bit,
  @DespatchDate DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [EITL_PODocumentList] SET 
   [SerialNo] = @SerialNo
  ,[DocumentID] = @DocumentID
  ,[RevisionNo] = @RevisionNo
  ,[Description] = @Description
  ,[ReadyToDespatch] = @ReadyToDespatch
  ,[Despatched] = @Despatched
  ,[DespatchDate] = @DespatchDate
  WHERE
  [SerialNo] = @Original_SerialNo
  AND [DocumentLineNo] = @Original_DocumentLineNo
  SET @RowCount = @@RowCount
GO
