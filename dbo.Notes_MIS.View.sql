USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view
[dbo].[Notes_MIS]
as
SELECT NotesHandle,
left(IndexValue,4) as Division,
count(NotesId) NoofNotes,
month(Created_Date) as Month1
  FROM [dbo].[Note_Notes]
  group by NotesHandle,
left(IndexValue,4),
month(Created_Date)
GO
