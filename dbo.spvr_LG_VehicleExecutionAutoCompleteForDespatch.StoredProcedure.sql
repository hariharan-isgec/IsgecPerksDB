USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvr_LG_VehicleExecutionAutoCompleteForDespatch]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ContextKey NVarChar(50) 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'


    select top 10 
	  (ExecutionDescription + ' | ' + (Select BPName from VR_BusinessPartner where BPID=TransporterID) ) as ExecutionDescription, 
      SRNNo  
    FROM [VR_RequestExecution]  
    WHERE VehiclePlacedOn between DATEADD(day,-7,GetDate()) and DATEADD(day,20,GETDATE()) 
	 AND SRNNO in (
     select SRNNo from VR_VehicleRequest where SupplierID = (select SupplierID from PAK_PO where SerialNo=@ContextKey and SRNNo is not NULL and POFOR='PK')) 
	 AND SRNNo not in (
	   select VRExecutionNo from PAK_PkgListH where VRExecutionNo is not NULL and SerialNo in (
		 select SerialNo from Pak_PO where SupplierID = (
		   select SupplierID from PAK_PO where SerialNo=@ContextKey and POFOR='PK'
         ) 
	   ) 
	 )
  
    
  END
GO
