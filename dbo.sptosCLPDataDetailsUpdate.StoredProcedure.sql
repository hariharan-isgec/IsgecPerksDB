USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataDetailsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_ProgressID Int, 
  @Original_CLPID Int, 
  @ProjectID NVarChar(6),
  @ProgressID Int,
  @CLPID Int,
  @engEndtDefined DateTime,
  @engEndtActual DateTime,
  @engdelayDays Int,
  @engdelayStatus NVarChar(50),
  @ordEndtDefined DateTime,
  @ordEndtActual DateTime,
  @orddelayDays Int,
  @orddelayStatus NVarChar(50),
  @desEndtDefined DateTime,
  @desEndtActual DateTime,
  @desdelayDays Int,
  @desdelayStatus NVarChar(50),
  @engRemarks NVarChar(500),
  @ordRemarks NVarChar(500),
  @desRemarks NVarChar(500),
  @momBy NVarChar(8),
  @momOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_CLPDataDetails] SET 
   [ProjectID] = @ProjectID
  ,[ProgressID] = @ProgressID
  ,[CLPID] = @CLPID
  ,[engEndtDefined] = @engEndtDefined
  ,[engEndtActual] = @engEndtActual
  ,[engdelayDays] = @engdelayDays
  ,[engdelayStatus] = @engdelayStatus
  ,[ordEndtDefined] = @ordEndtDefined
  ,[ordEndtActual] = @ordEndtActual
  ,[orddelayDays] = @orddelayDays
  ,[orddelayStatus] = @orddelayStatus
  ,[desEndtDefined] = @desEndtDefined
  ,[desEndtActual] = @desEndtActual
  ,[desdelayDays] = @desdelayDays
  ,[desdelayStatus] = @desdelayStatus
  ,[engRemarks] = @engRemarks
  ,[ordRemarks] = @ordRemarks
  ,[desRemarks] = @desRemarks
  ,[momBy] = @momBy
  ,[momOn] = @momOn
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [ProgressID] = @Original_ProgressID
  AND [CLPID] = @Original_CLPID
  SET @RowCount = @@RowCount
GO
