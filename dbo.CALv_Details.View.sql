USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CALv_Details]
AS
SELECT        dbo.CAL_Register.CallID, dbo.CAL_Register.UserID, dbo.aspnet_users.UserFullName, dbo.CAL_CallTypes.Description AS CallType, REPLACE(REPLACE(REPLACE(REPLACE(dbo.CAL_Register.CallDescription, CHAR(10), ' '), 
                         CHAR(13), ' '), ',', '-'),char(9),' ') AS CallDesc, dbo.CAL_Register.LoggedOn, dbo.CAL_Register.ResponseTime, dbo.CAL_Register.AttenderID, dbo.CAL_Register.AssignedOn, dbo.CAL_Register.AttendedOn, 
                         REPLACE(REPLACE(REPLACE(REPLACE(dbo.CAL_Register.AttenderDescription, CHAR(10), ' '), CHAR(13), ' '), ',', '-'),char(9),' ') AS AttenderNotes, dbo.CAL_Status.Description AS CallStatus, dbo.CAL_Register.ClosedOn, 
                         dbo.CAL_Register.SignedOffOn
FROM            dbo.CAL_Register INNER JOIN
                         dbo.CAL_CallTypes ON dbo.CAL_Register.CallTypeID = dbo.CAL_CallTypes.CallTypeID INNER JOIN
                         dbo.CAL_Status ON dbo.CAL_Register.CallStatusID = dbo.CAL_Status.CallStatusID INNER JOIN
                         dbo.aspnet_users ON dbo.CAL_Register.UserID = dbo.aspnet_users.LoginID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[12] 2[18] 3) )"
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
         Begin Table = "CAL_Register"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CAL_CallTypes"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 136
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CAL_Status"
            Begin Extent = 
               Top = 6
               Left = 479
               Bottom = 102
               Right = 649
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_users"
            Begin Extent = 
               Top = 6
               Left = 687
               Bottom = 136
               Right = 876
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
      Begin ColumnWidths = 10
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
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CALv_Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CALv_Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CALv_Details'
GO
