USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostWorkOrderTypesInsert]
  @WorkOrderTypeDescription NVarChar(50),
  @Return_WorkOrderTypeID Int = null OUTPUT 
  AS
  INSERT [COST_WorkOrderTypes]
  (
   [WorkOrderTypeDescription]
  )
  VALUES
  (
   @WorkOrderTypeDescription
  )
  SET @Return_WorkOrderTypeID = Scope_Identity()
GO
