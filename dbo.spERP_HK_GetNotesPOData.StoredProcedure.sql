USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spERP_HK_GetNotesPOData]



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
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R101%') as  BoilerCMNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%'  AND IndexValue LIKE 'R101%') as  BoilerLMNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
         AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R101%') as  BoilerLLNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R201%') as  SMDCMNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R201%') as  SMDLMNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R201%') as  SMDLLNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@cf,103) and convert(datetime,@ct,103)
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R301%') as  EPCCMNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@lf,103) and convert(datetime,@lt,103)
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R301%') as  EPCLMNPO,
  (select distinct indexvalue from Note_Notes where Created_Date between convert(datetime,@tf,103) and convert(datetime,@tt,103)
          AND NotesHandle LIKE '%P_PURCHASEORDER_200%' AND IndexValue LIKE 'R301%') as  EPCLLNPO 


  END
GO
