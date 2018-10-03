USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[baan_Texts]
as
Select
TextNo as TextNo,
TextSequence as TextSequence,
TextDescription as TextDescription
FROM 
OPENQUERY([BAAN],
'SELECT 
t$ctxt as TextNo,
t$seqe as TextSequence ,
t$text as TextDescription          
FROM baandb.ttttxt010100
') ;
GO
