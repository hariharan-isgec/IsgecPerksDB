USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CHKv_CheckPoints]
AS
SELECT     dbo.ADM_ServiceSheetHeader.SheetID, dbo.ADM_ServiceSheetDetails.SheetDate, dbo.ADM_ServiceSheetDetails.SerialNo, 
                      dbo.ADM_Services.Description AS Service, dbo.ADM_CheckPoints.Descriptions AS CheckPoints, dbo.ADM_Measures.Description AS Measure, 
                      dbo.ADM_Measures.MonitoringMechanism, dbo.aspnet_Users.UserFullName, dbo.ADM_ServiceSheetDetails.InitiatedOn, 
                      dbo.ADM_ServiceSheetDetails.InitiatorRemarks, dbo.ADM_ServiceSheetDetails.ProblemIdentified, 
                      dbo.ADM_ServiceSheetDetails.ProblemClosed
FROM         dbo.ADM_CheckPoints RIGHT OUTER JOIN
                      dbo.ADM_ServiceSheetDetails LEFT OUTER JOIN
                      dbo.aspnet_Users ON dbo.ADM_ServiceSheetDetails.InitiatedBy = dbo.aspnet_Users.LoginID LEFT OUTER JOIN
                      dbo.ADM_Services RIGHT OUTER JOIN
                      dbo.ADM_ServiceSheetHeader ON dbo.ADM_Services.ServiceID = dbo.ADM_ServiceSheetHeader.ServiceID ON 
                      dbo.ADM_ServiceSheetDetails.SheetID = dbo.ADM_ServiceSheetHeader.SheetID ON 
                      dbo.ADM_CheckPoints.CheckPointID = dbo.ADM_ServiceSheetDetails.CheckPointID LEFT OUTER JOIN
                      dbo.ADM_Measures ON dbo.ADM_ServiceSheetDetails.MeasureID = dbo.ADM_Measures.MeasureID
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
         Configuration = "(H (1[45] 4[21] 3) )"
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
         Configuration = "(H (1[49] 3) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ADM_Measures"
            Begin Extent = 
               Top = 6
               Left = 446
               Bottom = 99
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_Services"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_ServiceSheetDetails"
            Begin Extent = 
               Top = 134
               Left = 837
               Bottom = 305
               Right = 1001
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ADM_ServiceSheetHeader"
            Begin Extent = 
               Top = 218
               Left = 558
               Bottom = 326
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ADM_CheckPoints"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 114
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_Users"
            Begin Extent = 
               Top = 145
               Left = 34
               Bottom = 253
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_CheckPoints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Width = 284
         Width = 1500
         Width = 1500
         Width = 930
         Width = 1980
         Width = 2310
         Width = 2220
         Width = 1500
         Width = 1500
         Width = 1950
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_CheckPoints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CHKv_CheckPoints'
GO
