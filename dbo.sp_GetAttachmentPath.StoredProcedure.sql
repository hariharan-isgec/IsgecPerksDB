USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetAttachmentPath]
--@IndexValue varchar(50),
@AttachmentHandle varchar(50)
AS
BEGIN
Declare @DBID varchar(50)
Declare @LibraryCode varchar(50)
--@ServerName varchar(max),
--@PathName varchar(max);

--set @Attachment_Handle=(select top 1 AttachmentHAndle from ATH_Attachments where IndexValue=@IndexValue)
Set @DBID=(Select [DBID] From ATH_Handle Where Attachment_Handle=@AttachmentHandle)
Set @LibraryCode=(Select LibraryCode From ATH_Database where [DBID]=@DBID)

SELECT  ServerName,[Path],@LibraryCode  as Libcode From ATH_Library  Where LibraryCode=@LibraryCode

END

--exec  [sp_GetAttachmentPath] 101111
GO
