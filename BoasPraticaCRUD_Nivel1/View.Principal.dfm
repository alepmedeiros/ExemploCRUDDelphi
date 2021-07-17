object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'ViewPrincipal'
  ClientHeight = 555
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 233
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 5
      Top = 46
      Width = 697
      Height = 182
      Align = alClient
      DataSource = dsPedido
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDblClick = DBGrid1DblClick
    end
    object Panel4: TPanel
      Left = 5
      Top = 5
      Width = 697
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnAddPedido: TSpeedButton
        Left = 162
        Top = 13
        Width = 23
        Height = 22
        Caption = '+'
        OnClick = btnAddPedidoClick
      end
      object edtDescricao: TLabeledEdit
        Left = 5
        Top = 15
        Width = 148
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 233
    Width = 707
    Height = 282
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 5
      Top = 55
      Width = 697
      Height = 222
      Align = alClient
      DataSource = dsPedidoItens
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid2CellClick
      OnDblClick = DBGrid2DblClick
    end
    object Panel5: TPanel
      Left = 5
      Top = 5
      Width = 697
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnAddPedidoItens: TSpeedButton
        Left = 260
        Top = 15
        Width = 23
        Height = 22
        Caption = '+'
        OnClick = btnAddPedidoItensClick
      end
      object edtProduto: TLabeledEdit
        Left = 5
        Top = 16
        Width = 157
        Height = 21
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'Produto'
        TabOrder = 0
      end
      object edtQuantidade: TLabeledEdit
        Left = 168
        Top = 16
        Width = 84
        Height = 21
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'Quantidade'
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 515
    Width = 707
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnEcluir: TButton
      Left = 632
      Top = 0
      Width = 75
      Height = 40
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 0
      OnClick = btnEcluirClick
    end
    object btnListar: TButton
      Left = 557
      Top = 0
      Width = 75
      Height = 40
      Align = alRight
      Caption = 'Listar'
      TabOrder = 1
      OnClick = btnListarClick
    end
  end
  object dsPedido: TDataSource
    Left = 568
    Top = 80
  end
  object dsPedidoItens: TDataSource
    Left = 568
    Top = 248
  end
end
