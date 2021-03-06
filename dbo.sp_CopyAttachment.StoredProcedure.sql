USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_CopyAttachment]
@AttachmentHandle varchar(200),
@IndexValue varchar(100),
@PurposeCode varchar(200),
@FileName varchar(Max),
@LibraryCode varchar(50),
@AttachedBy varchar(50),
@DocumnetId varchar(200)
AS
BEGIN
--DECLARE @DocumnetId varchar(200)
DECLARE @RunningId int

SET @RunningId=(SELECT (ISNULL(MAX(RunningNumber),0) + 1)as RunningNo FROM ATH_DocumentSeries where Active='Y')

If(select count(*) as HandleCount from ATH_Handle Where Attachment_Handle=@AttachmentHandle)>0
BEGIN
INSERT INTO [ATH_Attachments]
           ([Document_RunningId]
           ,[DocumentId]
           ,[AttachmentHandle]
           ,[IndexValue]
           ,[PurposeCode]
           ,[FileName]
           ,[LibraryCode]
           ,[AttachedBy]
           ,[AttachedOn])            
            values(
            @RunningId,
            @DocumnetId,
            @AttachmentHandle,
            @IndexValue,
            @PurposeCode,
            @FileName,
            @LibraryCode,
            @AttachedBy,
            getdate()
            )
           
  Update ATH_DocumentSeries set RunningNumber=@RunningId where Active='Y'
  
  SELECT @DocumnetId
  END    
   ELSE
     Select 0        
END
GO
