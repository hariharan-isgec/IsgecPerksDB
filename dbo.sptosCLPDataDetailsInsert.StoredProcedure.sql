USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataDetailsInsert]
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
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_ProgressID Int = null OUTPUT, 
  @Return_CLPID Int = null OUTPUT 
  AS
  INSERT [TOS_CLPDataDetails]
  (
   [ProjectID]
  ,[ProgressID]
  ,[CLPID]
  ,[engEndtDefined]
  ,[engEndtActual]
  ,[engdelayDays]
  ,[engdelayStatus]
  ,[ordEndtDefined]
  ,[ordEndtActual]
  ,[orddelayDays]
  ,[orddelayStatus]
  ,[desEndtDefined]
  ,[desEndtActual]
  ,[desdelayDays]
  ,[desdelayStatus]
  ,[engRemarks]
  ,[ordRemarks]
  ,[desRemarks]
  ,[momBy]
  ,[momOn]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@ProgressID
  ,@CLPID
  ,@engEndtDefined
  ,@engEndtActual
  ,@engdelayDays
  ,@engdelayStatus
  ,@ordEndtDefined
  ,@ordEndtActual
  ,@orddelayDays
  ,@orddelayStatus
  ,@desEndtDefined
  ,@desEndtActual
  ,@desdelayDays
  ,@desdelayStatus
  ,@engRemarks
  ,@ordRemarks
  ,@desRemarks
  ,@momBy
  ,@momOn
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_ProgressID = @ProgressID
  SET @Return_CLPID = @CLPID
GO
