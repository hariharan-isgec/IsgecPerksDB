USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spERP_HK_GetMrnData]
  @cf NVarChar(10),
  @ct NVarChar(10),
  @lf NVarChar(10),
  @lt NVarChar(10),
  @tf NVarChar(10),
  @tt NVarChar(10)
  AS
  BEGIN
  Select 
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND substring(projectid,1,2) in ('CA', 'IP', 'JA', 'JB', 'JE', 'JG', 'AG', 'AS', 'PS', 'BS', 'DS')
  ) as  BoilerCM,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND substring(projectid,1,2) in ('CA', 'IP', 'JA', 'JB', 'JE', 'JG', 'AG', 'AS', 'PS', 'BS', 'DS')
  ) as  BoilerLM,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND substring(projectid,1,2) in ('CA', 'IP', 'JA', 'JB', 'JE', 'JG', 'AG', 'AS', 'PS', 'BS', 'DS')
  ) as  BoilerLL,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND substring(projectid,1,2) in ('JS', 'SE', 'SG', 'SS', 'XP')
  ) as  SMDCM,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND substring(projectid,1,2) in ('JS', 'SE', 'SG', 'SS', 'XP')
  ) as  SMDLM,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND substring(projectid,1,2) in ('JS', 'SE', 'SG', 'SS', 'XP')
  ) as  SMDLL,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND substring(projectid,1,2) in ('EC', 'EE', 'EG', 'EM', 'ES', 'JP')
  ) as  EPCCM,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND substring(projectid,1,2) in ('EC', 'EE', 'EG', 'EM', 'ES', 'JP')
  ) as  EPCLM,
  (select Count(*) from VR_LorryReceipts where createdOn between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND substring(projectid,1,2) in ('EC', 'EE', 'EG', 'EM', 'ES', 'JP')
  ) as  EPCLL 


  END
GO
