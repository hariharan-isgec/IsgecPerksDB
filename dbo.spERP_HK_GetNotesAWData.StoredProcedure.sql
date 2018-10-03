USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spERP_HK_GetNotesAWData]



  @cf NVarChar(10),
  @ct NVarChar(10),
  @lf NVarChar(10),
  @lt NVarChar(10),
  @tf NVarChar(10),
  @tt NVarChar(10)  
  AS  
  BEGIN
  Select 
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND IndexValue LIKE 'P101%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  BoilerCMNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND IndexValue LIKE 'P101%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  BoilerLMNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND IndexValue LIKE 'P101%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  BoilerLLNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND IndexValue LIKE 'P201%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  SMDCMNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND IndexValue LIKE 'P201%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  SMDLMNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND IndexValue LIKE 'P201%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  SMDLLNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND IndexValue LIKE 'P301%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  EPCCMNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND IndexValue LIKE 'P301%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  EPCLMNAW,
  (select count (distinct indexvalue) from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND IndexValue LIKE 'P301%' and UserId in ('5103','5203','5205','9532','5223','5225')) as  EPCLLNAW 

  END
GO
