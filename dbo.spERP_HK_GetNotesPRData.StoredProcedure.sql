USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spERP_HK_GetNotesPRData]



  @cf NVarChar(10),
  @ct NVarChar(10),
  @lf NVarChar(10),
  @lt NVarChar(10),
  @tf NVarChar(10),
  @tt NVarChar(10)  
  AS  
  BEGIN
  Select 
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R101%') as  BoilerCMNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%'  AND IndexValue LIKE 'R101%') as  BoilerLMNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
         AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R101%') as  BoilerLLNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R201%') as  SMDCMNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R201%') as  SMDLMNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R201%') as  SMDLLNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R301%') as  EPCCMNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R301%') as  EPCLMNPR,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND NotesHandle LIKE '%P_PURCHASEREQUISITION_200%' AND IndexValue LIKE 'R301%') as  EPCLLNPR 


  END
GO
