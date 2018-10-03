USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATNv_ShortLeaveAvailed]
AS
SELECT     TOP (100) PERCENT dbo.ATN_Attendance.AttenID, dbo.ATN_Attendance.AttenDate, dbo.ATN_Attendance.CardNo, 
                      CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END AS Punch1Time, dbo.ATN_Attendance.Punch2Time, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00') AS p1t, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00') AS p2t, 525 - DATEDIFF(mi, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00'), CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00')) AS difmin, dbo.HRM_EmployeeDetails.EmployeeName, 
                      dbo.HRM_EmployeeDetails.Designation, dbo.HRM_EmployeeDetails.Department, dbo.HRM_EmployeeDetails.Division, 
                      dbo.HRM_EmployeeDetails.Location
FROM         dbo.ATN_Attendance INNER JOIN
                      dbo.HRM_EmployeeDetails ON dbo.ATN_Attendance.CardNo = dbo.HRM_EmployeeDetails.CardNo
WHERE     (dbo.ATN_Attendance.FinYear = 2014) AND (dbo.ATN_Attendance.Applied1LeaveTypeID = 'SH') AND (dbo.ATN_Attendance.Posted = 1) AND 
                      (525 - DATEDIFF(mi, CONVERT(datetime, '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') 
                      + ':00'), CONVERT(datetime, '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00')) > 0) OR
                      (dbo.ATN_Attendance.FinYear = 2014) AND (dbo.ATN_Attendance.Posted = 1) AND (525 - DATEDIFF(mi, CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(CASE WHEN Punch1Time < 9.00 THEN 9.00 ELSE Punch1Time END, 6, 2), '.', ':') + ':00'), CONVERT(datetime, 
                      '01/01/2000' + REPLACE(STR(dbo.ATN_Attendance.Punch2Time, 6, 2), '.', ':') + ':00')) > 0) AND (dbo.ATN_Attendance.Applied2LeaveTypeID = 'SH')
ORDER BY difmin DESC, dbo.ATN_Attendance.CardNo, dbo.ATN_Attendance.AttenDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ATN_Attendance"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_EmployeeDetails"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 114
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_ShortLeaveAvailed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATNv_ShortLeaveAvailed'
GO
