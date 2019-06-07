object FormGeneralSet: TFormGeneralSet
  Left = 413
  Top = 235
  BorderStyle = bsSingle
  Caption = 'HLHLReborn - Settings'
  ClientHeight = 392
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox12: TGroupBox
    Left = 2
    Top = 111
    Width = 337
    Height = 114
    Caption = 'Battle Settings'
    TabOrder = 0
    object RadioGroupHumanAct: TRadioGroup
      Left = 3
      Top = 19
      Width = 212
      Height = 38
      Caption = 'Player'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Attack'
        'Defend'
        'Capture')
      TabOrder = 0
    end
    object RadioGroupPetAct: TRadioGroup
      Left = 3
      Top = 63
      Width = 212
      Height = 41
      Caption = 'Pet'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Attack'
        'Defend')
      TabOrder = 1
    end
    object RadioGroupWhatToDoWhenNoMonsterToCapture: TRadioGroup
      Left = 221
      Top = 19
      Width = 110
      Height = 86
      Caption = 'Capture - None'
      ItemIndex = 0
      Items.Strings = (
        'Fight'
        'Run')
      TabOrder = 2
    end
  end
  object GroupBox13: TGroupBox
    Left = 2
    Top = 231
    Width = 337
    Height = 58
    Caption = 'Speed'
    TabOrder = 1
    object Label34: TLabel
      Left = 3
      Top = 44
      Width = 21
      Height = 13
      Caption = '0ms'
    end
    object Label35: TLabel
      Left = 294
      Top = 45
      Width = 42
      Height = 13
      Caption = '1000ms'
    end
    object TrackBar1: TTrackBar
      Left = 3
      Top = 13
      Width = 328
      Height = 33
      Max = 1000
      PageSize = 100
      Frequency = 100
      Position = 500
      TabOrder = 0
      OnChange = TrackBar1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 5
    Width = 334
    Height = 100
    Caption = 'Medicine'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label19: TLabel
      Left = 8
      Top = 23
      Width = 35
      Height = 13
      Caption = 'Store'
    end
    object Label30: TLabel
      Left = 8
      Top = 53
      Width = 56
      Height = 13
      Caption = 'Medicine'
    end
    object Label3: TLabel
      Left = 243
      Top = 21
      Width = 42
      Height = 13
      Caption = 'Player'
    end
    object Label4: TLabel
      Left = 243
      Top = 48
      Width = 21
      Height = 13
      Caption = 'Pet'
    end
    object ComboBoxMed: TComboBox
      Left = 74
      Top = 45
      Width = 151
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15')
    end
    object cmbStore: TComboBox
      Left = 73
      Top = 18
      Width = 152
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      TabOrder = 1
      OnChange = cmbStoreChange
    end
    object EditPlayerLife: TEdit
      Left = 291
      Top = 18
      Width = 33
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      Text = '30'
    end
    object EditPetLife: TEdit
      Left = 291
      Top = 45
      Width = 33
      Height = 21
      NumbersOnly = True
      TabOrder = 3
      Text = '95'
    end
    object CheckBoxFullBlood: TCheckBox
      Left = 61
      Top = 74
      Width = 151
      Height = 26
      Caption = 'Level at full life'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CheckBoxNoHeal: TCheckBox
      Left = 218
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Disable Heal'
      TabOrder = 5
    end
  end
  object GroupBox1: TGroupBox
    Left = 2
    Top = 295
    Width = 337
    Height = 90
    Caption = 'Hotkey'
    TabOrder = 3
    object Label1: TLabel
      Left = 5
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Program'
    end
    object Label2: TLabel
      Left = 179
      Top = 15
      Width = 70
      Height = 13
      Caption = 'Grab Mouse'
    end
    object EditMainHotkey: TEdit
      Left = 3
      Top = 35
      Width = 159
      Height = 21
      Color = clInfoBk
      ImeMode = imClose
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = EditHotkeyKeyDown
    end
    object EditWinInfoHotkey: TEdit
      Left = 179
      Top = 34
      Width = 148
      Height = 21
      Color = clInfoBk
      ImeMode = imClose
      ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = EditHotkeyKeyDown
    end
    object ButtonApplyHotkey: TButton
      Left = 282
      Top = 61
      Width = 49
      Height = 22
      Caption = 'Apply'
      Enabled = False
      TabOrder = 2
      OnClick = ButtonApplyHotkeyClick
    end
  end
end
