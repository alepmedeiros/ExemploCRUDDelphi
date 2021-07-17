object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 344
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnaddpedido: TSpeedButton
    Left = 135
    Top = 7
    Width = 23
    Height = 22
    Caption = '+'
    OnClick = btnaddpedidoClick
  end
  object btnaddproduto: TSpeedButton
    Left = 183
    Top = 161
    Width = 23
    Height = 22
    Caption = '+'
    OnClick = btnaddprodutoClick
  end
  object grdPedido: TDBGrid
    Left = 8
    Top = 35
    Width = 431
    Height = 120
    DataSource = dsPedido
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = grdPedidoCellClick
  end
  object grdPedidoItens: TDBGrid
    Left = 8
    Top = 189
    Width = 431
    Height = 120
    DataSource = dsPedidoItens
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = grdPedidoItensCellClick
  end
  object btnListar: TButton
    Left = 8
    Top = 315
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 2
    OnClick = btnListarClick
  end
  object edtpedido: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtproduto: TEdit
    Left = 8
    Top = 161
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edtquantidade: TEdit
    Left = 135
    Top = 161
    Width = 42
    Height = 21
    TabOrder = 5
  end
  object btnExcluir: TButton
    Left = 283
    Top = 315
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
    OnClick = btnExcluirClick
  end
  object btnAtualizar: TButton
    Left = 202
    Top = 315
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 7
    OnClick = btnAtualizarClick
  end
  object btnSalvar: TButton
    Left = 364
    Top = 315
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btnSalvarClick
  end
  object dsPedido: TDataSource
    Left = 400
    Top = 120
  end
  object dsPedidoItens: TDataSource
    Left = 400
    Top = 232
  end
end
