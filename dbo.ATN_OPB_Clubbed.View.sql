USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATN_OPB_Clubbed]
AS
SELECT     TOP (100) PERCENT dbo.HRM_Employees.CardNo, dbo.HRM_Employees.EmployeeName, dbo.HRM_Employees.ActiveState, 
                      dbo.ATN_OPB_AP.Days AS ACC_PL, dbo.ATN_OPB_PL.Days AS CR_PL, dbo.ATN_OPB_AL_BF.Days AS ACC_LTC, dbo.ATN_OPB_LT.Days AS CR_LT, 
                      dbo.ATN_OPB_AS.Days AS ACC_SL, dbo.ATN_OPB_AP_DR.Days AS DR_PL, dbo.ATN_OPB_AS_DR.Days AS DR_SL
FROM         dbo.ATN_OPB_AS_DR RIGHT OUTER JOIN
                      dbo.HRM_Employees ON dbo.ATN_OPB_AS_DR.CardNo = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
                      dbo.ATN_OPB_AS ON dbo.HRM_Employees.CardNo = dbo.ATN_OPB_AS.CardNo LEFT OUTER JOIN
                      dbo.ATN_OPB_AP_DR ON dbo.HRM_Employees.CardNo = dbo.ATN_OPB_AP_DR.CardNo LEFT OUTER JOIN
                      dbo.ATN_OPB_AP ON dbo.HRM_Employees.CardNo = dbo.ATN_OPB_AP.CardNo LEFT OUTER JOIN
                      dbo.ATN_OPB_AL_BF ON dbo.HRM_Employees.CardNo = dbo.ATN_OPB_AL_BF.CardNo LEFT OUTER JOIN
                      dbo.ATN_OPB_PL ON dbo.HRM_Employees.CardNo = dbo.ATN_OPB_PL.CardNo LEFT OUTER JOIN
                      dbo.ATN_OPB_LT ON dbo.HRM_Employees.CardNo = dbo.ATN_OPB_LT.CardNo
WHERE     (dbo.HRM_Employees.ActiveState = 1) AND (dbo.HRM_Employees.C_DateOfReleaving IS NULL)
ORDER BY dbo.HRM_Employees.CardNo
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[13] 2[9] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ATN_OPB_AS_DR"
            Begin Extent = 
               Top = 6
               Left = 794
               Bottom = 114
               Right = 945
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 147
               Left = 538
               Bottom = 255
               Right = 729
            End
            DisplayFlags = 280
            TopColumn = 42
         End
         Begin Table = "ATN_OPB_AS"
            Begin Extent = 
               Top = 6
               Left = 605
               Bottom = 114
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_OPB_AP_DR"
            Begin Extent = 
               Top = 6
               Left = 416
               Bottom = 114
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_OPB_AP"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_OPB_AL_BF"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ATN_OPB_PL"
            Begin Extent = 
               Top = 114
               Left = 227
               Bottom = 222
               Right = 378
            End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_OPB_Clubbed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ATN_OPB_LT"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2310
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_OPB_Clubbed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ATN_OPB_Clubbed'
GO
