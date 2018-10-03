USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spERP_HK_GetPOWData]



  @cf NVarChar(10),
  @ct NVarChar(10),
  @lf NVarChar(10),
  @lt NVarChar(10),
  @tf NVarChar(10),
  @tt NVarChar(10)  
  AS  
  BEGIN
  Select 

  (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@cf,103) and convert(datetime,@ct,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
    AND substring(project,1,2) in ('CA', 'IP', 'JA', 'JB', 'JE', 'JG', 'AG', 'AS', 'PS', 'BS', 'DS')) as BoilerCMPOW,

    (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@lf,103) and convert(datetime,@lt,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
  AND substring(project,1,2) in ('CA', 'IP', 'JA', 'JB', 'JE', 'JG', 'AG', 'AS', 'PS', 'BS', 'DS')) as BoilerLMPOW,

    (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@tf,103) and convert(datetime,@tt,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
  AND substring(project,1,2) in ('CA', 'IP', 'JA', 'JB', 'JE', 'JG', 'AG', 'AS', 'PS', 'BS', 'DS')) as BoilerLLPOW,



    (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@cf,103) and convert(datetime,@ct,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
    AND substring(project,1,2) in ('JS', 'SE', 'SG', 'SS', 'XP')) as SMDCMPOW,

    (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@lf,103) and convert(datetime,@lt,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
  AND substring(project,1,2) in ('JS', 'SE', 'SG', 'SS', 'XP')) as SMDLMPOW,

    (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@tf,103) and convert(datetime,@tt,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
  AND substring(project,1,2) in ('JS', 'SE', 'SG', 'SS', 'XP')) as SMDLLPOW,




      (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@cf,103) and convert(datetime,@ct,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
    AND substring(project,1,2) in ('EC', 'EE', 'EG', 'EM', 'ES', 'JP')) as EPCCMPOW,

    (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@lf,103) and convert(datetime,@lt,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
  AND substring(project,1,2) in ('EC', 'EE', 'EG', 'EM', 'ES', 'JP')) as EPCLMPOW,

    (SELECT count(*) FROM WF1_PreOrder WHERE DateTime between convert(datetime,@tf,103) and convert(datetime,@tt,103) 
  AND (UserId NOT IN ('0340', '9583', '3019', '3194', '3100', '0330', '0639')) 
  AND substring(project,1,2) in ('EC', 'EE', 'EG', 'EM', 'ES', 'JP')) as EPCLLPOW


  END
GO
