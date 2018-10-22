USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcm_LG_SRequestsToBeAttended]
  @LoginID NVarChar(8),
  @SerialNo Int,
  @QclNo Int,
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_Requests].[RequestID] ,
		[QCM_Requests].[Description]  
  FROM [QCM_Requests] 
  WHERE [QCM_Requests].[OrderNo] = (Select PONumber from PAK_PO where serialno=@serialno and POFOR='PK') 
    AND [QCM_Requests].[RequestStateID] <> 'CLOSED' 
	AND [QCM_Requests].[RequestID] NOT IN (Select ISNull(QCRequestNo,'') from PAK_QCListH where SerialNo=@SerialNo and QCLNo<>@QclNo)
	AND [QCM_Requests].[AllotedStartDate] Between DATEADD(DD, -30, AllotedStartDate) and DATEADD(DD, 30, AllotedStartDate) 
  --Union All 
  --Select ISNull(QCRequestNo,'') as RequestID, 'BC' As [Description] from PAK_QCListH where SerialNo=@SerialNo and QCLNo=@QclNo
  ORDER BY RequestID 
  
  SET @RecordCount = @@RowCount
GO
