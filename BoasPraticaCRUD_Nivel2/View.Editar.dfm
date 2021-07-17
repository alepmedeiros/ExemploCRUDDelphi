object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 257
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 379
    Height = 257
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 379
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 0
      object edtDescricao: TEdit
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 177
        Height = 25
        Align = alLeft
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 217
      Width = 379
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 1
      object Button1: TButton
        Left = 299
        Top = 5
        Width = 75
        Height = 30
        Align = alRight
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 41
      Width = 379
      Height = 176
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 379
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 0
        object edtQuantidade: TEdit
          AlignWithMargins = True
          Left = 191
          Top = 8
          Width = 58
          Height = 24
          Align = alLeft
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtProduto: TEdit
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 177
          Height = 24
          Align = alLeft
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 40
        Width = 379
        Height = 136
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 1
        object lvPedidoItens: TListView
          Left = 5
          Top = 5
          Width = 369
          Height = 126
          Align = alClient
          BorderStyle = bsNone
          Columns = <
            item
              Caption = 'Item'
            end
            item
              Caption = 'Produto'
              Width = 150
            end
            item
              Caption = 'Quantidade'
              Width = 80
            end>
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = lvPedidoItensDblClick
        end
      end
    end
  end
  object dsPedidosItens: TDataSource
    Left = 328
    Top = 49
  end
  object dsPedidos: TDataSource
    Left = 272
    Top = 16
  end
end
