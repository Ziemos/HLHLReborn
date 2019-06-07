unit UnitSetWGAttr;
// ���ֻ��顤��������
interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, frmTemplate;

type
  TFormSetWGAttr = class(TfTemplate)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    EditWGName: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditWGXS: TEdit;
    EditWGNL: TEdit;
    ComboBoxWGQS: TComboBox;
    ComboBoxWGGJ: TComboBox;
    ComboBoxWGBZ: TComboBox;
    gbGJConfig: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    ComboBoxGJRank: TComboBox;
    ComboBoxGJLevel: TComboBox;
    Bevel1: TBevel;
    GroupBox14: TGroupBox;
    Label53: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    CheckBoxAutoDeleteWG: TCheckBox;
    ComboBoxDeleteFromPos: TComboBox;
    CheckBoxRemainEasyWG: TCheckBox;
    CheckBoxLevelLimit: TCheckBox;
    EditLevelLimited: TEdit;
    CheckBoxDoFateCreateWG: TCheckBox;
    CheckBoxRemainXS: TCheckBox;
    EditRemainedXS: TEdit;
    procedure EditWGXSKeyPress(Sender: TObject; var Key: Char);
    procedure EditWGNLKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxGJRankChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetFateEnableOrNot;
    procedure CheckBoxDoFateCreateWGClick(Sender: TObject);
    procedure CheckBoxRemainXSClick(Sender: TObject);
    procedure CheckBoxRemainEasyWGClick(Sender: TObject);
    procedure CheckBoxAutoDeleteWGClick(Sender: TObject);
    procedure CheckBoxLevelLimitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure LoadAttribute;
    procedure SaveAttribute;
  public
    { Public declarations }
    procedure DisableCreateWGObjs;
    procedure EnableCreateWGObjs;
    procedure SetCreateWGObjsEnabled(isEnable: Boolean);
  end;

var
  FormSetWGAttr: TFormSetWGAttr;

implementation

uses
	IniFiles, ClsGames,
  UnitTypesAndVars, UnitGlobal, UnitClasses, UnitConsts;

{$R *.dfm}

procedure TFormSetWGAttr.EditWGXSKeyPress(Sender: TObject; var Key: Char);
// ����ϵ������
begin
  if ((Key < '0') or (Key > '9')) and (Key <> '.') and (Key <> Chr(8)) and (Key <> Chr(13))
  then begin
    ShowMessage('Error: Must be a number');
    Key := Chr(0);
  end;
end;

procedure TFormSetWGAttr.EditWGNLKeyPress(Sender: TObject; var Key: Char);
// ������������
begin
  if ((Key < '0') or (Key > '9')) and (Key <> Chr(8)) and (Key <> Chr(13))
  then begin
    ShowMessage('Error: Must be a number');
    Key := Chr(0);
  end;
end;

procedure TFormSetWGAttr.ComboBoxGJRankChange(Sender: TObject);
// ���ù��ڶ���
var
  i: integer;
begin
  ComboBoxGJLevel.Clear;	// ������ڶ���
  case ComboBoxGJRank.ItemIndex of
    0, 1, 4, 5:	// 2��3ת�����ɡ����ɡ�ҹ�桢����
    	for i := 1 to 12 do
      	ComboBoxGJLevel.Items.Add(inttostr(i * 100 - 1));
    2, 7: 	// 4ת�����ޡ�ħ��
    	for i := 1 to 13 do
      	ComboBoxGJLevel.Items.Add(IntToStr(i * 100 - 1));
    3, 8:  	// 5ת������ħ��
    	for i := 1 to 4 do
      	ComboBoxGJLevel.Items.Add(IntToStr(i * 300 - 1));
  end;
end;

procedure TFormSetWGAttr.FormCreate(Sender: TObject);
var
  i: integer;
begin
 	// ���ô���λ��
  self.CFormName := IDS_WGAttrFormName;
  inherited;
	// װ������
  LoadAttribute;

  ThisUser.GetWGs;              // ��ȡ�书��Ϣ
  ComboBoxDeleteFromPos.Clear;	// ���ɾ�е��б�

  for i := 0 to ThisUser.WGCountLimit - 1 do  				// ���ݼ����������������
    ComboBoxDeleteFromPos.Items.Add(inttostr(i + 1));
  // ����Ĭ��ɾ�е�
  ComboBoxDeleteFromPos.ItemIndex := ComboBoxDeleteFromPos.Items.Count - 1;
end;

procedure TFormSetWGAttr.FormShow(Sender: TObject);
begin
  Caption := '�������á�' + HLInfoList.GlobalHL.UserName;
  SetFateEnableOrNot;

  //����ϵ��ʶ��
  CheckBoxRemainXS.Visible := False;
  EditRemainedXS.Visible := False;
  Label1.Visible := False;
end;

procedure TFormSetWGAttr.SetFateEnableOrNot;
// ����/�رչ��ڴ�������
var
	i: integer;
begin
	// ����/��ֹ�������ò���
  for i := 0 to gbGJConfig.ControlCount - 1 do
    gbGJConfig.Controls[i].Enabled := CheckBoxDoFateCreateWG.Checked;
  // ����رչ������ã��ָ�Ĭ�Ϲ��ڲ���
  if not CheckBoxDoFateCreateWG.Checked then
  begin
    ComboBoxGJRank.ItemIndex := -1;
    ComboBoxGJLevel.ItemIndex := -1;
  end;
end;

procedure TFormSetWGAttr.CheckBoxDoFateCreateWGClick(Sender: TObject);
// ���ڴ���
begin
  SetFateEnableOrNot;	// ����/�رչ��ڴ�������

  if not CheckBoxDoFateCreateWG.Checked then exit;	// ���ǹ��ڴ������˳�

  ThisUser.GetAttr;  // �����������
  // �����������ת��
  if ThisUser.Xianmo = UserAttrXian then  // ��
    ComboBoxGJRank.ItemIndex := ThisUser.Rank - 2
  else if ThisUser.Xianmo  = UserAttrMo then  // ħ
    ComboBoxGJRank.ItemIndex := ThisUser.Rank + 2
  else
  begin	// ���ˡ�ɢ��
    ComboBoxGJRank.ItemIndex := -1;
    CheckBoxDoFateCreateWG.Checked := False;
    SetFateEnableOrNot;
    exit;
  end;
  // ����ת���л���ˢ�¹��ڵȼ�����
  ComboBoxGJRankChange(Sender);
  // ����������ڵȼ�
  if ThisUser.Rank <> 5 then
  	ComboBoxGJLevel.ItemIndex := Floor((ThisUser.Level + 1) / 100) - 1
  else
  	ComboBoxGJLevel.ItemIndex := Floor((ThisUser.Level + 1) / 300) - 1;
end;

procedure TFormSetWGAttr.CheckBoxRemainXSClick(Sender: TObject);
// ѡ������ϵ����
// *******�Ѿ�ʧЧ**********
begin
  if CheckBoxRemainXS.Checked then CheckBoxRemainEasyWG.Checked:=False;
  EditRemainedXS.Enabled:=CheckBoxRemainXS.Checked;
end;

procedure TFormSetWGAttr.CheckBoxRemainEasyWGClick(Sender: TObject);
// ѡ���������У�������Ӧ״̬���Ѿ�ʧЧ��
begin
  if CheckBoxRemainEasyWG.Checked then CheckBoxRemainXS.Checked := False;
  EditRemainedXS.Enabled := CheckBoxRemainXS.Checked;
  Label1.Enabled := CheckBoxRemainXS.Checked;
end;

procedure TFormSetWGAttr.CheckBoxAutoDeleteWGClick(Sender: TObject);
// ѡ���Զ�ɾ��
begin
  ComboBoxDeleteFromPos.Enabled := CheckBoxAutoDeleteWG.Checked;
  CheckBoxRemainEasyWG.Enabled := CheckBoxAutoDeleteWG.Checked;
  CheckBoxRemainXS.Enabled := CheckBoxAutoDeleteWG.Checked;
  EditRemainedXS.Enabled := CheckBoxAutoDeleteWG.Checked and CheckBoxRemainXS.Checked;
  Label1.Enabled := CheckBoxAutoDeleteWG.Checked and CheckBoxRemainXS.Checked;
end;

procedure TFormSetWGAttr.DisableCreateWGObjs;
begin
  SetCreateWGObjsEnabled(False);
end;

procedure TFormSetWGAttr.EnableCreateWGObjs;
begin
  SetCreateWGObjsEnabled(True);

  ComboBoxDeleteFromPos.Enabled := CheckBoxAutoDeleteWG.Checked;
  CheckBoxRemainEasyWG.Enabled := CheckBoxAutoDeleteWG.Checked;
  CheckBoxRemainXS.Enabled := CheckBoxAutoDeleteWG.Checked;
  EditRemainedXS.Enabled := CheckBoxAutoDeleteWG.Checked and CheckBoxRemainXS.Checked;
  Label1.Enabled := CheckBoxAutoDeleteWG.Checked;
  EditLevelLimited.Enabled := CheckBoxLevelLimit.Checked;
  ComboBoxGJRank.Enabled := CheckBoxDoFateCreateWG.Checked;
  ComboBoxGJLevel.Enabled := CheckBoxDoFateCreateWG.Checked;
end;


procedure TFormSetWGAttr.SetCreateWGObjsEnabled(isEnable: Boolean); //������Щ�����Enable������Disable
begin
  EditWGName.Enabled := isEnable;
  EditWGXS.Enabled := isEnable;
  EditWGNL.Enabled := isEnable;
  ComboBoxWGQS.Enabled := isEnable;
  ComboBoxWGGJ.Enabled := isEnable;
  ComboBoxWGBZ.Enabled := isEnable;
  EditLevelLimited.Enabled := isEnable;
  Label14.Enabled := isEnable;
  CheckBoxLevelLimit.Enabled := isEnable;
  CheckBoxAutoDeleteWG.Enabled := isEnable;
  CheckBoxDoFateCreateWG.Enabled := isEnable;
  CheckBoxRemainEasyWG.Enabled := isEnable;
  CheckBoxRemainXS.Enabled := isEnable;
  ComboBoxDeleteFromPos.Enabled := isEnable;
  Label53.Enabled := isEnable;
  EditRemainedXS.Enabled := isEnable;
  Label1.Enabled := isEnable;
  ComboBoxGJRank.Enabled := isEnable;
  ComboBoxGJLevel.Enabled := isEnable;
end;

procedure TFormSetWGAttr.CheckBoxLevelLimitClick(Sender: TObject);
// ѡ��ֹͣ���еȼ�
begin
  EditLevelLimited.Enabled := CheckBoxLevelLimit.Checked;
end;

procedure TFormSetWGAttr.LoadAttribute;
// װ������
var
	iTmp: Integer;
  fTmp: Currency;
begin

	with TIniFile.Create(IDS_UsersPath + HLInfoList.GlobalHL.UserName + '.Ini') do // ����
  try
    // �����书����
    self.EditWGName.Text := ReadString(IDS_WGAttrFormName, IDS_WG_Name, IDS_WG_NameDef);
    // �����书ϵ��
	  fTmp := ReadFloat(IDS_WGAttrFormName, IDS_WG_XiShu, 1);
    if (fTmp <= 0) or (fTmp > 2) then fTmp := 1;
  	EditWGXS.Text := FloatToStr(fTmp);
    // �����书����
  	iTmp := ReadInteger(IDS_WGAttrFormName, IDS_WG_NeiLi, 100);
    EditWGNL.Text := IntToStr(iTmp);
    // �����书��ʽ
  	iTmp := ReadInteger(IDS_WGAttrFormName, IDS_WG_ZiShi, 0);
    if (iTmp < 0) or (iTmp >= ComboBoxWGQS.Items.Count) then iTmp := 0;
    ComboBoxWGQS.ItemIndex := iTmp;

  	iTmp := ReadInteger(IDS_WGAttrFormName, IDS_WG_GuiJi, 0);
    if (iTmp < 0) or (iTmp >= ComboBoxWGGJ.Items.Count) then iTmp := 0;
    ComboBoxWGGJ.ItemIndex := iTmp;

  	iTmp := ReadInteger(IDS_WGAttrFormName, IDS_WG_BaoZha, 0);
    if (iTmp < 0) or (iTmp >= ComboBoxWGBZ.Items.Count) then iTmp := 0;
    ComboBoxWGBZ.ItemIndex := iTmp;
  finally
  	Free;
  end;
end;

procedure TFormSetWGAttr.SaveAttribute;
// ��������
begin
	with TIniFile.Create(IDS_UsersPath + HLInfoList.GlobalHL.UserName + '.Ini') do // ����
  try
    // �����书����
    WriteString(IDS_WGAttrFormName, IDS_WG_Name, self.EditWGName.Text);
    // �����书ϵ��
	  WriteFloat(IDS_WGAttrFormName, IDS_WG_XiShu, StrToFloatDef(EditWGXS.Text, 1));

    // �����书����
  	WriteInteger(IDS_WGAttrFormName, IDS_WG_NeiLi, StrToIntDef(EditWGNL.Text, 100));
    // �����书��ʽ
  	WriteInteger(IDS_WGAttrFormName, IDS_WG_ZiShi, ComboBoxWGQS.ItemIndex);
  	WriteInteger(IDS_WGAttrFormName, IDS_WG_GuiJi, ComboBoxWGGJ.ItemIndex);
  	WriteInteger(IDS_WGAttrFormName, IDS_WG_BaoZha, ComboBoxWGBZ.ItemIndex);
  finally
  	free;
  end;
end;

procedure TFormSetWGAttr.FormDestroy(Sender: TObject);
begin
	// ��������
	SaveAttribute;
 	// ���洰��λ��
  inherited;
end;

end.
