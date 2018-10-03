USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BaaN_IRNoPackingListNo]
AS
SELECT  IRNo,
        PackingListNo
FROM  OPENQUERY(baan,  
'SELECT   
		 ttfacp902200.T$ninv as IRNo, 
     ttfacp902200.t$plno as PackingListNo
 FROM  ttfacp902200
')
GO
