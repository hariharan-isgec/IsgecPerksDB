USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcm_LG_RequestsToBeAttended]
  @LoginID NVarChar(8),
  @SupplierID NVarChar(9),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_Requests].[RequestID] ,
		[QCM_Requests].[Description]  
  FROM [QCM_Requests] 
  WHERE [QCM_Requests].[SupplierID] = @SupplierID 
    AND [QCM_Requests].[RequestStateID] <> 'CLOSED' 
	AND [QCM_Requests].[AllotedStartDate] >= DATEADD(DD, -530, GetDate())
	AND [QCM_Requests].[AllotedTo] = case when @LoginID = '0340' then [QCM_Requests].[AllotedTo] else @LoginID end
  ORDER BY RequestID 

  SET @RecordCount = @@RowCount
GO
