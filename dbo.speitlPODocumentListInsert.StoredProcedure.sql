USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPODocumentListInsert]
  @SerialNo Int,
  @DocumentID NVarChar(50),
  @RevisionNo NVarChar(3),
  @Description NVarChar(200),
  @ReadyToDespatch Bit,
  @Despatched Bit,
  @DespatchDate DateTime,
  @Return_SerialNo Int = null OUTPUT, 
  @Return_DocumentLineNo Int = null OUTPUT 
  AS
  INSERT [EITL_PODocumentList]
  (
   [SerialNo]
  ,[DocumentID]
  ,[RevisionNo]
  ,[Description]
  ,[ReadyToDespatch]
  ,[Despatched]
  ,[DespatchDate]
  )
  VALUES
  (
   @SerialNo
  ,@DocumentID
  ,@RevisionNo
  ,@Description
  ,@ReadyToDespatch
  ,@Despatched
  ,@DespatchDate
)
  SET @Return_SerialNo = @SerialNo
  SET @Return_DocumentLineNo = Scope_Identity()
GO
