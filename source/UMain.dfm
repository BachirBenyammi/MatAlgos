object Form1: TForm1
  Left = 134
  Top = 145
  Width = 704
  Height = 546
  Caption = 'Algorithmes du  Recherche Opr'#233'rationelle'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TStringGrid
    Left = 349
    Top = 88
    Width = 300
    Height = 300
    ColCount = 2
    DefaultColWidth = 30
    DefaultRowHeight = 30
    RowCount = 2
    TabOrder = 9
  end
  object Button2: TButton
    Left = 336
    Top = 16
    Width = 121
    Height = 25
    Caption = 'Fermeture transitive'
    TabOrder = 0
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 321
    Height = 433
    Caption = 'Matrice d'#39'adjacence'
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 28
      Height = 13
      Caption = '&Taille:'
    end
    object Label2: TLabel
      Left = 24
      Top = 96
      Width = 30
      Height = 13
      Caption = '&Valeur'
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 24
      Width = 81
      Height = 25
      Caption = '&Ouvrir'
      TabOrder = 0
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777000000000007777700333333333077770B0333333333
        07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
        77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
        7007777777770777070777777777700077777777777777777777}
    end
    object BitBtn1: TBitBtn
      Left = 104
      Top = 24
      Width = 81
      Height = 25
      Caption = '&Enregister'
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
    end
    object BitBtn3: TBitBtn
      Left = 192
      Top = 24
      Width = 75
      Height = 25
      Caption = 'E&ffacer'
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222222222222222222222222222222222222800000082222222207777770022
        2222207777770802222228077777088022222207F7F7F088022222207F7F7F08
        8022222207F7F7F088822222207F7F7F080222222207F7F7F802222222207F7F
        7702222222228000088222222222222222222222222222222222}
    end
    object Matrice: TStringGrid
      Left = 13
      Top = 120
      Width = 300
      Height = 300
      ColCount = 2
      DefaultColWidth = 30
      DefaultRowHeight = 30
      RowCount = 2
      TabOrder = 7
    end
    object Edit_Count: TEdit
      Left = 64
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '2'
      OnKeyPress = Edit_CountKeyPress
    end
    object BtnFixer: TBitBtn
      Left = 192
      Top = 56
      Width = 75
      Height = 25
      Caption = '&Fixer'
      TabOrder = 4
      OnClick = BtnFixerClick
    end
    object BtnAjouter: TButton
      Left = 192
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Ajouter'
      TabOrder = 6
      OnClick = BtnAjouterClick
    end
    object Edit_Value: TEdit
      Left = 64
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 5
      Text = '0'
      OnKeyPress = Edit_ValueKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 336
    Top = 80
    Width = 321
    Height = 377
    Caption = 'Matrice resultat'
    TabOrder = 2
    object MatRes: TStringGrid
      Left = 8
      Top = 64
      Width = 300
      Height = 300
      ColCount = 2
      DefaultColWidth = 30
      DefaultRowHeight = 30
      RowCount = 2
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 16
      Top = 24
      Width = 81
      Height = 25
      Caption = 'Ouvrir'
      TabOrder = 0
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777777777777777777000000000007777700333333333077770B0333333333
        07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
        77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
        7007777777770777070777777777700077777777777777777777}
    end
    object BitBtn5: TBitBtn
      Left = 104
      Top = 24
      Width = 81
      Height = 25
      Caption = 'Enregister'
      TabOrder = 1
      OnClick = BitBtn5Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222220000000000000220330000008803022033000000880302203300000088
        0302203300000000030220333333333333022033000000003302203088888888
        0302203088888888030220308888888803022030888888880302203088888888
        0002203088888888080220000000000000022222222222222222}
    end
    object BitBtn6: TBitBtn
      Left = 192
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Effacer'
      TabOrder = 2
      OnClick = BitBtn6Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222222222222222222222222222222222222800000082222222207777770022
        2222207777770802222228077777088022222207F7F7F088022222207F7F7F08
        8022222207F7F7F088822222207F7F7F080222222207F7F7F802222222207F7F
        7702222222228000088222222222222222222222222222222222}
    end
  end
  object Button1: TButton
    Left = 464
    Top = 16
    Width = 89
    Height = 25
    Caption = 'Graphe inverse'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 560
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Graphe compl'#233'mentaire'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 464
    Top = 48
    Width = 89
    Height = 25
    Caption = 'Matrice inverse'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 560
    Top = 48
    Width = 129
    Height = 25
    Caption = 'Matrice compl'#233'mentaire'
    TabOrder = 6
    OnClick = Button5Click
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 448
    Width = 321
    Height = 49
    Caption = 'Nbr de circuits'
    TabOrder = 7
    object Label3: TLabel
      Left = 10
      Top = 28
      Width = 39
      Height = 13
      Caption = 'Longeur'
    end
    object Lab_Nbr_Cir: TLabel
      Left = 216
      Top = 24
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Edit_Long: TEdit
      Left = 56
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Button6: TButton
      Left = 182
      Top = 16
      Width = 27
      Height = 25
      Caption = '='
      TabOrder = 1
      OnClick = Button6Click
    end
  end
  object Button7: TButton
    Left = 336
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Produit'
    TabOrder = 8
    OnClick = Button7Click
  end
  object OD: TOpenDialog
    FileName = 'Table.ini'
    Filter = 'Ini Files|*.Ini'
    Left = 136
  end
  object SD: TSaveDialog
    FileName = 'Table.ini'
    Filter = 'Ini Files|*.Ini'
    Left = 168
  end
end
