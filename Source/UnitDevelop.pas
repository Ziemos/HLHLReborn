unit UnitDevelop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, UnitGlobal, UnitTypesAndVars, UnitConsts,
  ExtCtrls, Grids, UnitClasses, ClsGames;

type
  TFormDevelop = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    edtInputChar: TEdit;
    btnInputChar: TButton;
    Edit2: TEdit;
    btnInputString: TButton;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    btnMouseLeftClick: TButton;
    EditX: TEdit;
    EditY: TEdit;
    btnMouseLeftDoubleClick: TButton;
    lstWindows: TListBox;
    btnLocateToPlayWindow: TButton;
    btnLocateToMainPanel: TButton;
    ButtonRefreshWindow: TButton;
    btnGetWindowText: TButton;
    edtWindowText: TEdit;
    Label6: TLabel;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    btnReadGameData: TButton;
    btnPrevPage: TButton;
    btnNextPage: TButton;
    Edit12: TEdit;
    Edit13: TEdit;
    Button12: TButton;
    Button14: TButton;
    TabSheet3: TTabSheet;
    GroupBox6: TGroupBox;
    Label18: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    ListBox2: TListBox;
    ListBox4: TListBox;
    ListBox6: TListBox;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    ComboBox3: TComboBox;
    ComboBox5: TComboBox;
    btnMapMove: TButton;
    ListBox5: TListBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    btnPosMove: TButton;
    Button9: TButton;
    TabSheet4: TTabSheet;
    GroupBox9: TGroupBox;
    Button21: TButton;
    GroupBox10: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    GroupBox11: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    GroupBox1: TGroupBox;
    Button22: TButton;
    StringGrid1: TStringGrid;
    ButtonDisableWindow: TButton;
    ButtonEnableWindow: TButton;
    TabSheet5: TTabSheet;
    Button6: TButton;
    Button16: TButton;
    MemoDialog: TMemo;
    ListBoxBattleCreatures: TListBox;
    ButtonDisplayBattleCreatures: TButton;
    TabSheet6: TTabSheet;
    ComboBoxStoveRoom0: TComboBox;
    ComboBoxStoveRoom1: TComboBox;
    ComboBoxStoveRoom2: TComboBox;
    ComboBoxStoveRoom3: TComboBox;
    ComboBoxStoveRoom6: TComboBox;
    ComboBoxStoveRoom5: TComboBox;
    ComboBoxStoveRoom4: TComboBox;
    ComboBoxStoveRoom7: TComboBox;
    ButtonShowStuffsToBeChozen: TButton;
    ListBoxItemsInStove: TListBox;
    ButtonShowStoveInstuction: TButton;
    ComboBoxStoveMainRoom: TComboBox;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Button18: TButton;
    ListBoxCurrInstruction: TListBox;
    Button19: TButton;
    MaskEditWriteAddr: TMaskEdit;
    Label19: TLabel;
    Label26: TLabel;
    ButtonWriteByte: TButton;
    MaskEditByteToWrite: TMaskEdit;
    Button20: TButton;
    ButtonUniverseStoveMemPatch: TButton;
    btnHideWindow: TButton;
    btnShowWindow: TButton;
    btnCloseWindow: TButton;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label30: TLabel;
    Button26: TButton;
    MaskEdit4: TMaskEdit;
    Label29: TLabel;
    MaskEdit5: TMaskEdit;
    Label33: TLabel;
    TabSheet7: TTabSheet;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    ComboBox1: TComboBox;
    btnCallNPC: TButton;
    Button37: TButton;
    Button27: TButton;
    Button36: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    ButtonTestInnerScript: TButton;
    Button41: TButton;
    Button42: TButton;
    Label34: TLabel;
    Label35: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    procedure btnInputCharClick(Sender: TObject);
    procedure btnInputStringClick(Sender: TObject);
    procedure btnMouseLeftClickClick(Sender: TObject);
    procedure btnMouseLeftDoubleClickClick(Sender: TObject);
    procedure btnLocateToPlayWindowClick(Sender: TObject);
    procedure btnLocateToMainPanelClick(Sender: TObject);
    procedure btnGetWindowTextClick(Sender: TObject);
    procedure ButtonRefreshWindowClick(Sender: TObject);
    procedure btnReadGameDataClick(Sender: TObject);
    procedure btnPrevPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox6Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure btnMapMoveClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnPosMoveClick(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonDisableWindowClick(Sender: TObject);
    procedure ButtonEnableWindowClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure ButtonDisplayBattleCreaturesClick(Sender: TObject);
    procedure ButtonShowStuffsToBeChozenClick(Sender: TObject);
    procedure ButtonShowStoveInstuctionClick(Sender: TObject);
    procedure ComboBoxStoveMainRoomChange(Sender: TObject);
    procedure ComboBoxStoveRoom0Change(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure ButtonWriteByteClick(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure ButtonUniverseStoveMemPatchClick(Sender: TObject);
    procedure btnHideWindowClick(Sender: TObject);
    procedure btnShowWindowClick(Sender: TObject);
    procedure btnCloseWindowClick(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure btnCallNPCClick(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure ButtonTestInnerScriptClick(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
  private
    function GetCurrWin: TWindowInfo;
  private
    { Private declarations }
    property CurrWin: TWindowInfo read GetCurrWin;
  public
    { Public declarations }
    procedure RefreshWinList;

    procedure InitStoveStuffsToBeChozen;
    procedure ShowStoveStuffsToBeChozen;
    procedure MakeStoveInstruction; // û�д�����������������ATTRΪ$4d4
  end;

  TStoveStuffToBeChozen1 = record
    Stuff: TItem;
    ChozenBy: TComboBox; // ��˭Chozen�ˣ������Nil����û�б�Chozen
  end;

  TStoveStuffsToBeChozen1 = record
    StuffCount: integer;
    Stuffs: array [0..14] of TStoveStuffToBeChozen1;
  end;

  TPStoveStuffToBeChozen1 = ^TStoveStuffToBeChozen1;

var
  StoveStuffsToBeChozen1: TStoveStuffsToBeChozen1;

//procedure GetStoveStuffsToBeChozen;

var
  FormDevelop: TFormDevelop;

implementation

uses UnitMain, UnitShowWorkTransactions, ClsMaps;

{$R *.dfm}

procedure TFormDevelop.RefreshWinList();
var
  strtmp: String;
  i: Integer;
  tmpWin: TWindowInfo;
begin
  lstWindows.Items.BeginUpdate;
  try
    lstWindows.Clear;
    HLInfoList.GlobalHL.ReCalWin;
    for i := 0 to HLInfoList.GlobalHL.Count - 1 do
    begin
      tmpWin := HLInfoList.GlobalHL.Items[i];
      strtmp := tmpWin.prefix
        + Format('%-8d:0x%s', [tmpWin.Window, IntToHex(tmpWin.Window, 8)])
        + ' [' + tmpWin.Title + ']'
        + ' <' + tmpWin.ClassName+'>'
        + '����' + IntToStr(tmpWin.Left)
        + ' ��' + IntToStr(tmpWin.Top)
        + ' ��' + IntToStr(tmpWin.Right)
        + ' ��' + IntToStr(tmpWin.Bottom);
      lstWindows.Items.Add(strtmp);
    end;
    lstWindows.ItemIndex := 0;
  finally
    lstWindows.Items.EndUpdate;
  end;
  Label6.Caption := '����' + IntToStr(lstWindows.Count) + '������';
end;

procedure TFormDevelop.btnInputCharClick(Sender: TObject);
Var
  Ch: Char;
  tmpWin: TWindowInfo;
begin
  Ch := edtInputChar.Text[1];
  tmpWin := HLInfoList.GlobalHL.Items[lstWindows.ItemIndex];
  PostMessage(tmpWin.Window, WM_CHAR, Ord(Ch), 1);
end;

procedure TFormDevelop.btnInputStringClick(Sender: TObject);
// �����ַ���
var
  tmpstr: array [0..254] of Char;
begin
  StrCopy(tmpstr, PChar(Edit2.Text));
  PostMessage(CurrWin.Window, WM_SETTEXT, 0, LPARAM(@tmpstr));
end;

procedure TFormDevelop.btnMouseLeftClickClick(Sender: TObject);
// ģ������������
var
  X, Y: Integer;
begin
  X := StrToIntDef(EditX.Text, 0);
  Y := StrToIntDef(EditY.Text, 0);
  PostMessage(CurrWin.Window, WM_LBUTTONDOWN, MK_LBUTTON, MakeLong(X, Y));
  PostMessage(CurrWin.Window, WM_LBUTTONUP, 0, MakeLong(X, Y));
end;

procedure TFormDevelop.btnMouseLeftDoubleClickClick(Sender: TObject);
// ģʽ������˫��
begin
  LeftDblClickOnSomeWindow_Post(CurrWin.Window,
    StrToIntDef(EditX.Text, 0), StrToIntDef(EditY.Text, 0));
end;

procedure TFormDevelop.btnLocateToPlayWindowClick(Sender: TObject);
// ��λ����Ϸ����
var
  tmpWin: TWindowInfo;
begin
  lstWindows.ItemIndex := HLInfoList.GlobalHL.LocateToPlayWindow(tmpWin);
end;

procedure TFormDevelop.btnLocateToMainPanelClick(Sender: TObject);
// ��λ�������
begin
  lstWindows.ItemIndex := HLInfoList.GlobalHL.LocateToMainPanel;
end;

procedure TFormDevelop.btnGetWindowTextClick(Sender: TObject);
// ��ȡ��������
begin
  edtWindowText.Text := WindowGetText(CurrWin.Window);
end;

procedure TFormDevelop.ButtonRefreshWindowClick(Sender: TObject);
// ˢ�´����б�
begin
  RefreshWinList;
end;

procedure TFormDevelop.btnReadGameDataClick(Sender: TObject);
// ����Ϸ����
var
  ProcessHandle: THandle;
  lpBuffer: pchar;
  nSize: DWORD;
  lpNumberOfBytes: SIZE_T;
  i: integer;
  addr:DWORD;
  s, linestr, linepartstr: string;
  tmpchar: CHAR;
begin
  Memo1.Lines.Clear;
  memo1.lines.Add('�û���' + HLInfoList.GlobalHL.UserName
    + ', �ºţ�' + HLInfoList.GlobalHL.UserNick
    + ', ��ż��' + HLInfoList.GlobalHL.UserSpouse);
  memo1.lines.add('Process ID��' + IntToHex(HLInfoList.GlobalHL.ProcessId, 8));
  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);
  memo1.Lines.Add('Process Handle: ' + intTohex(ProcessHandle, 8));
  memo1.Lines.Add('');
  Memo1.Lines.Add('�����ڴ��е�����:');
  memo1.Lines.Add('Address: '+MaskEdit1.text);

  addr := HexToInt(MaskEdit1.text);
  nSize := StrToInt(Edit1.text);
  if nSize > 0 then
  begin
    lpBuffer := AllocMem(nSize);
    if(not ReadProcessMemory(ProcessHandle, Pointer(addr), lpBuffer, nSize, lpNumberOfBytes))
      or(nSize<>lpNumberOfBytes) then
    begin
      ShowMessage('�����ݳ���������ָ���ĵ�ַ������.');
      Exit;
    end;
    s := '';
    linestr := '';
    linepartstr := '';
    for i := 0  to nSize - 1 do
    begin
      s := s + format('%.2X ', [ord(lpBuffer[i])]);
      if (ord(lpBuffer[i]) < 32) or (ord(lpBuffer[i]) = 255) then tmpchar := '.'
      else tmpchar := lpBuffer[i];
      if linestr <> '' then linepartstr := linepartstr+tmpchar;
      linestr := linestr + tmpchar;

      {��ȡ����}
      if ((i mod 16 ) = 15) or (i = nSize - 1) then
      begin
        tmpchar := lpBuffer[i+1];
        linepartstr:=linepartstr+tmpchar;
        s:=' '+s+' : '+linestr+'   :   '+linepartstr;
        Memo1.Lines.Add(s);
        s := '';
        linestr := '';
        linepartstr := '';
      end;
    end;
    MaskEdit4.Text := IntToHex(ord(lpBuffer[3]) * 65536 * 256
      + ord(lpBuffer[2]) * 65536
      + ord(lpBuffer[1]) * 256
      + ord(lpBuffer[0]), 8);
    FreeMem(lpBuffer, nSize);
  end;
  CloseHandle(ProcessHandle);

end;

procedure TFormDevelop.btnPrevPageClick(Sender: TObject);
// ����Ϸ��һҳ����
begin
  MaskEdit1.Text := IntToHex(HexToInt(MaskEdit1.Text) - StrToIntDef(Edit1.Text, 0), 8);
  btnReadGameData.Click;
end;

procedure TFormDevelop.btnNextPageClick(Sender: TObject);
// ����Ϸ��һҳ����
begin
  MaskEdit1.Text := IntToHex(HexToInt(MaskEdit1.Text) + StrToIntDef(Edit1.Text, 0), 8);
  btnReadGameData.Click;
end;

procedure TFormDevelop.Button12Click(Sender: TObject);
begin
  Edit13.Text := IntToStr(HexToInt(Edit12.Text));
end;

procedure TFormDevelop.Button14Click(Sender: TObject);
begin
  Edit13.Text := '0x' + IntToHex(StrToInt(Edit12.Text), 1);
end;

procedure TFormDevelop.ListBox2Click(Sender: TObject);
var
  i: integer;
  tmpMap, tmptmpmap: TMapInfo;
  tmpNode: TNodeInfo;
begin
  tmpMap := GameMaps.Items[ListBox2.ItemIndex];
  ListBox4.Clear;
  for i := 0 to tmpMap.NodeList.Count - 1 do
  begin
    tmpNode := tmpMap.NodeList.Items[i];
    tmptmpmap := GameMaps.ItemOfMapID(tmpNode.OutMapID);
    ListBox4.Items.Add('Node ' + IntToStr(i) + ': ' + IntToStr(tmpNode.InHL_X)
      + ', ' + IntToStr(tmpNode.InHL_Y) + ', ' + tmptmpmap.Name);
  end;
  ListBox4.ItemIndex := 0;
end;

procedure TFormDevelop.ListBox6Click(Sender: TObject);
var
  i: integer;
  tmpTransport: TTransportInfo;
  tmpStep: TStepInfo;
begin
  tmpTransport := GameMaps.TransportList.Items[ListBox6.ItemIndex];
  ListBox4.Clear;
  for i := 0 to tmpTransport.Count - 1 do
  begin
    tmpStep := tmpTransport.Items[i];
    ListBox4.Items.Add('Step ' + IntToStr(i) + ': '
      + IntToStr(tmpStep.Action) + ', ' + tmpStep.X + ', ' + tmpStep.Y);
  end;
  ListBox4.ItemIndex := 0;
end;

procedure TFormDevelop.ComboBox6Change(Sender: TObject);
var
  tmpZone: TZoneInfo;
  tmpMap: TMapInfo;
  i: integer;
begin
  ComboBox3.Clear;

  tmpZone := GameMaps.ZoneList.Items[ComboBox6.ItemIndex];

  for i:=0 to tmpZone.MapList.Count-1 do
  begin
    tmpMap := tmpZone.MapList.Items[i];
    ComboBox3.Items.Add(tmpMap.Name);
  end;
  ComboBox3.ItemIndex:=0;
end;

procedure TFormDevelop.ComboBox7Change(Sender: TObject);
var
  tmpZone: TZoneInfo;
  tmpMap: TMapInfo;
  i: integer;
begin
  ComboBox5.Clear;

  tmpZone := GameMaps.ZoneList.Items[ComboBox7.ItemIndex];

  for i := 0 to tmpZone.MapList.Count - 1 do
  begin
    tmpMap := tmpZone.MapList.Items[i];
    ComboBox5.Items.Add(tmpMap.Name);
  end;
  ComboBox5.ItemIndex := 0;
end;

procedure TFormDevelop.btnMapMoveClick(Sender: TObject);
var
  i:integer;
  tmpZone: TZoneInfo;
  tmpMap: TMapInfo;
  tmpNode: TNodeInfo;
  tmpTrans: TTransportInfo;
  tmpString: WideString;
  FromPos, ToPos: Integer;
begin
  ListBox5.Clear;
  // ���
  tmpZone := GameMaps.ZoneList.Items[ComboBox6.ItemIndex];
  tmpMap := tmpZone.MapList.Items[ComboBox3.ItemIndex];
  FromPos := tmpMap.PosInMapList;
  // �յ�
  tmpZone := GameMaps.ZoneList.Items[ComboBox7.ItemIndex];
  tmpMap := tmpZone.MapList.Items[ComboBox5.ItemIndex];
  ToPos := tmpMap.PosInMapList;
  if ThisMove = nil then
    ThisMove.Create;
  if not ThisMove.Init(FromPos, ToPos) then
  begin
    ShowMessage('û���ҵ�·�����޷��ƶ�');
    Exit;
  end;

  for i := 0 to ThisMove.PathNodeCount - 1 do
  begin
    tmpNode := ThisMove.GetCurrPathNode;
    tmpMap := tmpNode.MyMap;
    tmpString := 'Step ' + IntToStr(i + 1) + ': ��[' + tmpMap.Name + ']��';
    if tmpNode.InHL_X = -1 then // Ҫ�����͵�
    begin
      tmpTrans := GameMaps.TransportList.Items[tmpNode.InHL_Y];
      tmpString := tmpString + '���͵�[' + IntToStr(tmpTrans.ID) + ']';
    end
    else
      tmpString := tmpString + '<' + IntToStr(tmpNode.InHL_X) + ','
        + IntToStr(tmpNode.InHL_Y) + '>';

    tmpMap := GameMaps.ItemOfMapID(tmpNode.OutMapID);
    tmpString := tmpString + '��[' + tmpMap.Name + ']';
    ListBox5.Items.Add(tmpString);
    ThisMove.GotoNextPathNode;
  end;
end;

procedure TFormDevelop.Button9Click(Sender: TObject);
var
  lpMapName: PChar;
  MapID:DWORD;
  X, Y: DWORD;
begin
  lpMapName := AllocMEM(16);
  ReadFromHLMEM(Pointer(UserCurMapNameAddress), lpMapName, 16);
  ReadFromHLMEM(Pointer(UserCurMapAddress), @MapID, 4);
  GetCurrPosXY(X, Y);
  Label17.Caption := '����' + lpMapName + '[' + IntToStr(MapID)
    + ']������Ϊ' + IntToStr(X) + ',' + IntToStr(Y);
  FreeMEM(lpMapName, 16);
end;

procedure TFormDevelop.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key<'0') or (Key>'9')
  then begin
    showmessage('������������');
    Key := Chr(0);
  end;
end;

procedure TFormDevelop.btnPosMoveClick(Sender: TObject);
begin
  MoveToHL_Pos(StrToInt(Edit10.Text), StrToInt(Edit11.Text), false);
end;

procedure TFormDevelop.Button21Click(Sender: TObject);
begin
  ThisUser.GetAttr;

  Label35.Caption := IntToStr(ThisUser.Level);
  Label53.Caption := IntToStr(ThisUser.Xiu_Level);

  Label39.Caption := IntToStr(ThisUser.Tili);
  Label31.Caption := IntToStr(ThisUser.Neigong);
  Label32.Caption := IntToStr(ThisUser.Gongji);
  Label40.Caption := IntToStr(ThisUser.Fangyu);
  Label41.Caption := IntToStr(ThisUser.Qinggong);


  Label49.Caption := IntToStr(ThisUser.CurrLife) + '/' + IntToStr(ThisUser.MaxLife);
  Label45.Caption := IntToStr(ThisUser.CurrNeili) + '/' + IntToStr(ThisUser.MaxNeili);
end;

procedure TFormDevelop.Button22Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 15 do StringGrid1.Rows[i].Clear;

  ThisUser.GetItems;
  for i := 0 to ThisUser.ItemCount - 1 do
  begin
    StringGrid1.Cells[0, i + 1] := IntToStr(i + 1);
    StringGrid1.Cells[1, i + 1] := ThisUser.Items[i].Name;
    StringGrid1.Cells[2, i + 1] := ThisUser.Items[i].Maker;
    StringGrid1.Cells[3, i + 1] := IntToStr(ThisUser.Items[i].ItemType);
    StringGrid1.Cells[4, i + 1] := IntToStr(ThisUser.Items[i].PlusLife);
    StringGrid1.Cells[5, i + 1] := IntToStr(ThisUser.Items[i].PlusNeili);
    StringGrid1.Cells[6, i + 1] := IntToStr(ThisUser.Items[i].PlusGongji);
    StringGrid1.Cells[7, i + 1] := IntToStr(ThisUser.Items[i].PlusFangyu);
    StringGrid1.Cells[8, i + 1] := IntToStr(ThisUser.Items[i].PlusMinjie);
    StringGrid1.Cells[9, i + 1] := IntToHex(ThisUser.Items[i].ID, 8);
  end;
end;

procedure TFormDevelop.FormCreate(Sender: TObject);
var
  i: integer;
  tmpMap: TMapInfo;
  tmpTransport: TTransportInfo;
  tmpZone: TZoneInfo;
begin
  ListBox2.Clear;
  for i := 0 to GameMaps.Count - 1 do
  begin
    tmpMap := GameMaps.Items[i];
    if tmpMap.ID = 0 then GameMaps.ReadOneMap(tmpMap.PosInMapList);
    ListBox2.Items.Add(IntToStr(i) + '. ' + tmpMap.Name);
  end;
  ListBox2.ItemIndex := 0;

  ListBox6.Clear;
  for i := 0 to GameMaps.TransportList.Count - 1 do
  begin
    tmpTransport := GameMaps.TransportList.Items[i];
    ListBox6.Items.Add('���͵�[' + IntToStr(tmpTransport.ID) + ']: '
      + IntToStr(tmpTransport.Count) + ' Steps');
  end;
  ListBox6.ItemIndex:=0;

  ComboBox6.Clear;
  ComboBox7.Clear;
  for i := 0 to GameMaps.ZoneList.Count - 1 do
  begin
    tmpZone := GameMaps.ZoneList.Items[i];
    ComboBox6.Items.Add(tmpZone.Name);
    ComboBox7.Items.Add(tmpZone.Name);
  end;
  ComboBox6.ItemIndex := 0;
  ComboBox7.ItemIndex := 0;
  ComboBox6Change(Sender);
  ComboBox7Change(Sender);

  StringGrid1.Cells[0, 0] := 'No.';
  StringGrid1.Cells[1, 0] := '����';
  StringGrid1.Cells[2, 0] := '������';
  StringGrid1.Cells[3, 0] := '����';
  StringGrid1.Cells[4, 0] := '+Ѫ';
  StringGrid1.Cells[5, 0] := '+��';
  StringGrid1.Cells[6, 0] := '+��';
  StringGrid1.Cells[7, 0] := '+��';
  StringGrid1.Cells[8, 0] := '+��';

  ComboBoxStoveMainRoom.Clear;
  ComboBoxStoveMainRoom.Items.Add('--δѡ��--');
  InitStoveStuffsToBeChozen;
  for i := 0 to 7 do
    ComboBoxStoveMainRoom.Items.Add(IntToStr(i) + '. ' + StoveRooms[i]);
  ShowStoveStuffsToBeChozen;
end;

procedure TFormDevelop.FormShow(Sender: TObject);
begin
  RefreshWinList;
end;

procedure TFormDevelop.ButtonDisableWindowClick(Sender: TObject);
// ��ֹ����
begin
  EnableWindow(CurrWin.Window, False);
end;

procedure TFormDevelop.ButtonEnableWindowClick(Sender: TObject);
// ʹ�ܴ���
begin
  EnableWindow(CurrWin.Window, True);
end;

procedure TFormDevelop.Button6Click(Sender: TObject);
begin
  CancelNPCDialog;
end;

procedure TFormDevelop.Button16Click(Sender: TObject);
begin
  MemoDialog.Clear;
  MemoDialog.Lines.Add(GetNPCDialog);
end;

procedure TFormDevelop.ButtonDisplayBattleCreaturesClick(Sender: TObject);
var
  i: integer;
  tmpCreature: CreatureInfo;
begin
  ThisBattle.GetCreatures;
  ListBoxBattleCreatures.Clear;
  for i := 0 to ThisBattle.CreatureCount - 1 do
  begin
    tmpCreature:=ThisBattle.Creatures.Items[i];
    ListBoxBattleCreatures.Items.Add(tmpCreature.Name + ' : '
      + IntToStr(tmpCreature.Level) + ' : ' + IntToHex(tmpCreature.ID, 8));
  end;

end;

procedure TFormDevelop.ButtonShowStuffsToBeChozenClick(Sender: TObject);
var
  i: integer;
begin
  ComboBoxStoveMainRoom.Clear;
  ComboBoxStoveMainRoom.Items.Add('--δѡ��--');
  ComboBoxStoveMainRoomChange(Sender);
  
  InitStoveStuffsToBeChozen;

  for i := 0 to 7 do ComboBoxStoveMainRoom.Items.Add(IntToStr(i) + '. ' + StoveRooms[i]);

  ShowStoveStuffsToBeChozen;
end;

procedure TFormDevelop.ShowStoveStuffsToBeChozen;
{var
  i, j, tmpindex: integer;
  tmpStoveStuffToBeChozen:TPStoveStuffToBeChozen1;
  tmpItem: TItem;
  tmpComboBox: TComboBox;         }
begin
{
  for i:=0 to 7 do
  begin
    case i of
      0: tmpComboBox:=ComboBoxStoveRoom0;
      1: tmpComboBox:=ComboBoxStoveRoom1;
      2: tmpComboBox:=ComboBoxStoveRoom2;
      3: tmpComboBox:=ComboBoxStoveRoom3;
      4: tmpComboBox:=ComboBoxStoveRoom4;
      5: tmpComboBox:=ComboBoxStoveRoom5;
      6: tmpComboBox:=ComboBoxStoveRoom6;
      7: tmpComboBox:=ComboBoxStoveRoom7;
    end;

    tmpComboBox.Clear;
    tmpComboBox.Items.Add('--δѡ��--');
    tmpindex:=1;
    for j:=0 to StoveStuffsToBeChozenCount-1 do
    begin
      tmpStoveStuffToBeChozen:=@StoveStuffsToBeChozen.Stuffs[j];
      if (tmpStoveStuffToBeChozen.ChozenBy=nil) or (tmpStoveStuffToBeChozen.ChozenBy=tmpComboBox) then
      begin
        tmpItem:=tmpStoveStuffToBeChozen.Stuff;
        tmpComboBox.AddItem(tmpItem.Name+'.'+IntToHex(tmpItem.ID, 8), TObject(tmpStoveStuffToBeChozen));
        if tmpStoveStuffToBeChozen.ChozenBy=tmpComboBox then tmpComboBox.ItemIndex:=tmpindex; // �����������ComboBoxѡ���
        tmpindex:=tmpindex+1;
      end;
    end;
  end;
}
end;

procedure TFormDevelop.MakeStoveInstruction; // û�д�����������������ATTRΪ$4d4
var
  i: Integer;
  tmpComboBox: TComboBox;
  tmpStoveStuffToBeChozen: TPStoveStuffToBeChozen;
begin
  for i := 0 to 7 do
  begin
    case i of
      0: tmpComboBox := ComboBoxStoveRoom0;
      1: tmpComboBox := ComboBoxStoveRoom1;
      2: tmpComboBox := ComboBoxStoveRoom2;
      3: tmpComboBox := ComboBoxStoveRoom3;
      4: tmpComboBox := ComboBoxStoveRoom4;
      5: tmpComboBox := ComboBoxStoveRoom5;
      6: tmpComboBox := ComboBoxStoveRoom6;
      7: tmpComboBox := ComboBoxStoveRoom7;
    end;

    if tmpComboBox.ItemIndex <= 0 then
    begin
      StoveInstruction.Stuffs[i].StuffID := 0;
      StoveInstruction.Stuffs[i].StuffAttr := $4d2;
    end
    else
    begin
      tmpStoveStuffToBeChozen := TPStoveStuffToBeChozen(tmpComboBox.Items.Objects[tmpComboBox.ItemIndex]);

      StoveInstruction.Stuffs[i].StuffID := tmpStoveStuffToBeChozen.Stuff.ID;
      StoveInstruction.Stuffs[i].StuffAttr := $4d6;
    end;
  end;
end;

procedure TFormDevelop.ButtonShowStoveInstuctionClick(Sender: TObject);
var
  i: Integer;
begin
  MakeStoveInstruction;

  ListBoxItemsInStove.Clear;
  ListBoxItemsInStove.Items.Add('����λ�ã�'+IntToStr(StoveInstruction.MainStuffPos));
  for i := 0 to 7 do
  begin
    ListBoxItemsInStove.Items.Add(IntToStr(i) + '. '
      + IntToHex(StoveInstruction.Stuffs[i].StuffAttr, 8) + '.'
      + IntToHex(StoveInstruction.Stuffs[i].StuffID, 8));
  end;

end;

procedure TFormDevelop.ComboBoxStoveMainRoomChange(Sender: TObject);
var
  i: integer;
  tmpComboBox: TComboBox;
begin
  for i := 0 to 7 do
  begin
    case i of
      0: tmpComboBox := ComboBoxStoveRoom0;
      1: tmpComboBox := ComboBoxStoveRoom1;
      2: tmpComboBox := ComboBoxStoveRoom2;
      3: tmpComboBox := ComboBoxStoveRoom3;
      4: tmpComboBox := ComboBoxStoveRoom4;
      5: tmpComboBox := ComboBoxStoveRoom5;
      6: tmpComboBox := ComboBoxStoveRoom6;
      7: tmpComboBox := ComboBoxStoveRoom7;
    end;
    tmpComboBox.Font.Style := [];
  end;

  case ComboBoxStoveMainRoom.ItemIndex - 1 of
    0: tmpComboBox := ComboBoxStoveRoom0;
    1: tmpComboBox := ComboBoxStoveRoom1;
    2: tmpComboBox := ComboBoxStoveRoom2;
    3: tmpComboBox := ComboBoxStoveRoom3;
    4: tmpComboBox := ComboBoxStoveRoom4;
    5: tmpComboBox := ComboBoxStoveRoom5;
    6: tmpComboBox := ComboBoxStoveRoom6;
    7: tmpComboBox := ComboBoxStoveRoom7;
  end;

  if ComboBoxStoveMainRoom.ItemIndex <= 0 then Exit;

  if tmpComboBox.ItemIndex > 0 then
    tmpComboBox.Font.Style := [fsBold]
  else
    ComboBoxStoveMainRoom.ItemIndex := 0;

  StoveInstruction.MainStuffPos := ComboBoxStoveMainRoom.ItemIndex - 1;
end;

procedure TFormDevelop.ComboBoxStoveRoom0Change(Sender: TObject);
{var
  tmpComboBox: TComboBox;
  i: integer;
  tmpStoveStuffToBeChozen:TPStoveStuffToBeChozen1;   }
begin
{
  tmpComboBox:=TComboBox(Sender);
  if tmpComboBox.ItemIndex>0 then
  begin
    tmpStoveStuffToBeChozen:=TPStoveStuffToBeChozen1(tmpComboBox.Items.Objects[tmpComboBox.ItemIndex]);

    for i:=0 to StoveStuffsToBeChozen.StuffCount-1 do
    begin
      if StoveStuffsToBeChozen1.Stuffs[i].ChozenBy=tmpComboBox then StoveStuffsToBeChozen1.Stuffs[i].ChozenBy:=Nil;
    end;
    tmpStoveStuffToBeChozen.ChozenBy:=tmpComboBox;

    ShowStoveStuffsToBeChozen;
  end
  else
  begin
    ComboBoxStoveMainRoom.ItemIndex:=0;
    tmpComboBox.Font.Style:=[];
  end;
}
end;

procedure TFormDevelop.InitStoveStuffsToBeChozen; // �Ȳ����������������
{var
  i, j: integer;      }
begin
{
  StoveInstruction.MainStuffPos:=-1;
  GetUserItems;
  j:=0;
  for i:=0 to UserItems.ItemCount-1 do
  begin
    if (UserItems.Items[i].Name='��Ǭ����') or (UserItems.Items[i].Name='���ٱ���') then continue;
    StoveStuffsToBeChozen.Stuffs[j].Stuff:=UserItems.Items[i];
    StoveStuffsToBeChozen1.Stuffs[j].ChozenBy:=Nil;
    j:=j+1;
  end;
  StoveStuffsToBeChozen.StuffCount:=j;
}
end;

procedure TFormDevelop.Button18Click(Sender: TObject);
var
  i, j: integer;
  AddressofUniverseStoveForm: DWORD;
  MainStuffPos: Integer;
  StuffAttr, StuffNameLink, StuffID: Integer;
  tmpComboBox: TComboBox;
  tmpStoveStuffToBeChozen:TPStoveStuffToBeChozen;
begin
  ButtonShowStuffsToBeChozen.Click;

  ReadFromHLMEM(Pointer(HL_UniverseStoveFormAddressAddress), @AddressofUniverseStoveForm, 4);
  ReadFromHLMEM(Pointer(AddressofUniverseStoveForm + $458), @MainStuffPos, 4);

  ListBoxCurrInstruction.Clear;
  ListBoxCurrInstruction.Items.Add('����λ�ã�' + IntToStr(MainStuffPos));

  for i:=0 to 7 do
  begin
    ReadFromHLMEM(Pointer(AddressofUniverseStoveForm + $3f8 + i * 12), @StuffAttr, 4);
    ReadFromHLMEM(Pointer(AddressofUniverseStoveForm + $3f8 + i * 12 + 4), @StuffNameLink, 4);
    ReadFromHLMEM(Pointer(AddressofUniverseStoveForm + $3f8 + i * 12 + 8), @StuffID, 4);
    ListBoxCurrInstruction.Items.Add(IntToStr(i) + '. '
      + IntToHex(StuffAttr, 8) + '.' + IntToHex(StuffNameLink, 8)
      + '.' + IntToHex(StuffID, 8));

    case i of
      0: tmpComboBox := ComboBoxStoveRoom0;
      1: tmpComboBox := ComboBoxStoveRoom1;
      2: tmpComboBox := ComboBoxStoveRoom2;
      3: tmpComboBox := ComboBoxStoveRoom3;
      4: tmpComboBox := ComboBoxStoveRoom4;
      5: tmpComboBox := ComboBoxStoveRoom5;
      6: tmpComboBox := ComboBoxStoveRoom6;
      7: tmpComboBox := ComboBoxStoveRoom7;
    end;

    for j := 1 to tmpComboBox.Items.Count - 1 do
    begin
      tmpStoveStuffToBeChozen := TPStoveStuffToBeChozen(tmpComboBox.Items.Objects[j]);
      if tmpStoveStuffToBeChozen.Stuff.ID = StuffID then
      begin
        tmpComboBox.ItemIndex := j;
        break;
      end
    end;
  end;

  ComboBoxStoveMainRoom.ItemIndex := MainStuffPos+1;
  ComboBoxStoveMainRoomChange(Sender);
end;

procedure TFormDevelop.Button19Click(Sender: TObject);
var
  ProcessHandle: THandle;
  lpBuffer: Byte;
  lpNumberOfBytes: SIZE_T;
begin
  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);
  lpBuffer := $0c;
  WriteProcessMemory(ProcessHandle, Pointer($66431a), @lpBuffer, 1, lpNumberOfBytes);
  lpBuffer := $7c;
  WriteProcessMemory(ProcessHandle, Pointer($664300), @lpBuffer, 1, lpNumberOfBytes);
  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.ButtonWriteByteClick(Sender: TObject);
// д�ֽ���Ϣ����Ϸ
var
  ProcessHandle: THandle;
  lpBuffer: Byte;
  lpNumberOfBytes: SIZE_T;
  Addr: DWORD;
begin
  Addr := HexToInt(MaskEditWriteAddr.Text);
  lpBuffer := HexToInt(MaskEditByteToWrite.Text);
  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);
  WriteProcessMemory(ProcessHandle, Pointer(Addr), @lpBuffer, 1, lpNumberOfBytes);
  CloseHandle(ProcessHandle);
  MaskEditWriteAddr.Text := IntToHex(HexToInt(MaskEditWriteAddr.Text) + 1, 8);
  MaskEditByteToWrite.Text := '00';
  btnReadGameData.Click;
  MaskEditByteToWrite.SetFocus;
end;

procedure TFormDevelop.Button20Click(Sender: TObject);
var
  i: integer;
  AddressofUniverseStoveForm: DWORD;
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
begin
  ReadFromHLMEM(Pointer(HL_UniverseStoveFormAddressAddress),
    @AddressofUniverseStoveForm, 4);

  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);
  WriteProcessMemory(ProcessHandle, Pointer(AddressofUniverseStoveForm + $458),
    @StoveInstruction.MainStuffPos, 4, lpNumberOfBytes);

  for i := 0 to 7 do
  begin
    WriteProcessMemory(ProcessHandle,
      Pointer(AddressofUniverseStoveForm + $3f8 + i * 12),
      @StoveInstruction.Stuffs[i].StuffAttr, 4, lpNumberOfBytes);
//    WriteProcessMemory(ProcessHandle, Pointer(AddressofUniverseStoveForm+$3f8+i*12+4), @StoveInstruction.Stuffs[i].StuffAttr, 4, lpNumberOfBytes);
    WriteProcessMemory(ProcessHandle,
      Pointer(AddressofUniverseStoveForm + $3f8 + i * 12 + 8),
      @StoveInstruction.Stuffs[i].StuffID, 4, lpNumberOfBytes);
  end;
  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.ButtonUniverseStoveMemPatchClick(Sender: TObject);
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffers: array [0..5] of Byte;
  i: integer;
begin
  Buffers[0] := $0f;
  Buffers[1] := $85;
  Buffers[2] := $44;
  Buffers[3] := $02;
  Buffers[4] := $00;
  Buffers[5] := $00;

  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  for i := 0 to 5 do
  begin
    WriteProcessMemory(ProcessHandle, Pointer($459d8b + i),
      @Buffers[i], 1, lpNumberOfBytes);
  end;

  Buffers[0] := $90;
  for i := 0 to 7 do
  begin
    WriteProcessMemory(ProcessHandle, Pointer($556b07 + i),
      @Buffers[0], 1, lpNumberOfBytes);
  end;

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.btnHideWindowClick(Sender: TObject);
// ���ش���
begin
  ShowWindow(CurrWin.Window, SW_HIDE);
end;

procedure TFormDevelop.btnShowWindowClick(Sender: TObject);
// ��ʾ����
begin
  ShowWindow(CurrWin.Window, SW_SHOW);
end;

procedure TFormDevelop.btnCloseWindowClick(Sender: TObject);
// �رմ���
begin
  SendMessage(CurrWin.Window, WM_Close, 0, 0);
end;

procedure TFormDevelop.Button26Click(Sender: TObject);
// �����ַ����������Ϸ����
var
  tmpDWord: DWORD;
begin
  MaskEdit3.Text := IntToHex(HexToInt(MaskEdit4.Text) + HexToInt(MaskEdit2.Text), 8);

  ReadFromHLMEM(Pointer(HexToInt(MaskEdit3.Text)), @tmpDWord, 4);
  MaskEdit5.Text := IntToHex(tmpDWord, 8);
end;

procedure TFormDevelop.Button28Click(Sender: TObject);
// Patch1
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffer: WORD;
begin
  Buffer := $9090;
  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  WriteProcessMemory(ProcessHandle, Pointer($53ceb2), @Buffer, 2, lpNumberOfBytes);

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.Button29Click(Sender: TObject);
// UnPatch1
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffer: WORD;
begin
  Buffer := $0974;
  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  WriteProcessMemory(ProcessHandle, Pointer($53ceb2), @Buffer, 2, lpNumberOfBytes);

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.Button30Click(Sender: TObject);
// �����鱦��
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffer0, Buffer1, Buffer2: DWORD;
begin
  Buffer0 := $94840f66;
  Buffer1 := $e9000001;
  Buffer2 := $000002be;

  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  WriteProcessMemory(ProcessHandle, Pointer($53CF58), @Buffer0, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF5c), @Buffer1, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF60), @Buffer2, 4, lpNumberOfBytes);

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.Button31Click(Sender: TObject);
// UnPatch2
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffer0, Buffer1, Buffer2: DWORD;
begin
  Buffer0 := $0f3a7f66;
  Buffer1 := $00019284;
  Buffer2 := $05f88300;

  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  WriteProcessMemory(ProcessHandle, Pointer($53CF58), @Buffer0, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF5c), @Buffer1, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF60), @Buffer2, 4, lpNumberOfBytes);

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.Button32Click(Sender: TObject);
// ��������
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffer0, Buffer1, Buffer2: DWORD;
begin
  Buffer0 := $4e840f64;
  Buffer1 := $e9000001;
  Buffer2 := $000002be;

  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  WriteProcessMemory(ProcessHandle, Pointer($53CF58), @Buffer0, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF5c), @Buffer1, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF60), @Buffer2, 4, lpNumberOfBytes);

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.Button33Click(Sender: TObject);
// ���д��
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffer0, Buffer1, Buffer2: DWORD;
begin
  Buffer0 := $71840F65;
  Buffer1 := $E9000001;
  Buffer2 := $000002BE;

  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  WriteProcessMemory(ProcessHandle, Pointer($53CF58), @Buffer0, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF5C), @Buffer1, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF60), @Buffer2, 4, lpNumberOfBytes);

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.Button34Click(Sender: TObject);
// ���г���Ա
var
  ProcessHandle: THandle;
  lpNumberOfBytes: SIZE_T;
  Buffer0, Buffer1, Buffer2: DWORD;
begin
  Buffer0 := $B7840F67;
  Buffer1 := $E9000001;
  Buffer2 := $000002BE;

  ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, false, HLInfoList.GlobalHL.ProcessId);

  WriteProcessMemory(ProcessHandle, Pointer($53CF58), @Buffer0, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF5C), @Buffer1, 4, lpNumberOfBytes);
  WriteProcessMemory(ProcessHandle, Pointer($53CF60), @Buffer2, 4, lpNumberOfBytes);

  CloseHandle(ProcessHandle);
end;

procedure TFormDevelop.Button37Click(Sender: TObject);
var
  i: integer;
begin
  ComboBox1.Clear;
  for i := 0 to Ord(High(TNPCID)) do
  begin
    ComboBox1.Items.Add(NPCs[i].Name);
  end;
  ComboBox1.ItemIndex:=0;
end;

procedure TFormDevelop.btnCallNPCClick(Sender: TObject);
begin
  if ComboBox1.ItemIndex = -1 then Exit;

//  BeginCallNPC(NPCIDsArray[ComboBox1.ItemIndex]);
  BeginCallNPC(TNPCID(ComboBox1.ItemIndex));

  // ����ط�Ҫ�ö�ʱ��������
  repeat
    Sleep(100);
  until HLInfoList.GlobalHL.ItemOfWindowTitle(NPCs[ComboBox1.ItemIndex].SatisfiedCond) <> nil;

  EndCallNPC;
end;

procedure TFormDevelop.Button27Click(Sender: TObject);
begin
  ThisBuyStuff.PatchShop;
end;

procedure TFormDevelop.Button36Click(Sender: TObject);
begin
  ThisBuyStuff.UnpatchShop;
end;

procedure TFormDevelop.Button38Click(Sender: TObject);
var
  tmpWin: TWindowInfo;
begin
  HLInfoList.GlobalHL.LocateToPlayWindow(tmpWin);
  if tmpWin = nil then Exit; // û���ҵ�
  SendMessage(tmpWin.Window, $7E8, $3EA, 0);
end;

procedure TFormDevelop.Button39Click(Sender: TObject);
begin
  ThisUser.PatchItemWindow;
end;

procedure TFormDevelop.Button40Click(Sender: TObject);
begin
  ThisUser.UnpatchItemWindow;
end;

procedure TFormDevelop.ButtonTestInnerScriptClick(Sender: TObject);
var
  tmpTransaction: TTransaction;
  tmpPurpose: PurposeInfo;
begin
  ThisWork.Clean;

  // Transaction 0
  tmpTransaction := ThisWork.AddTransaction('�����书����');
  tmpTransaction.AddStep(ActSetWGAttr, '�ڰ��ǳ�', '2', '500');
  tmpTransaction.AddStep(ActSetWGDisp, '7', '15', '14');
  tmpTransaction.AddStep(ActOpenItemWindow, '', '', '');

  // Transaction 1
  tmpTransaction := ThisWork.AddTransaction('׼����ҩ');
  tmpPurpose := tmpTransaction.AddPurpose;
  tmpPurpose.Allows.Add('��Ʒ,�����,����������,1');
  tmpTransaction.AddStep(ActCallNPC, 'ˮ��ҩ����', '', '');
  tmpTransaction.AddStep(ActBuyStuff, '�����', '����������', '');
  tmpTransaction.AddStep(ActQuitShop, '', '', '');

  // Transaction 2
  tmpTransaction := ThisWork.AddTransaction('��������ҩƷ');
  tmpPurpose:= tmpTransaction.AddPurpose;
  tmpPurpose.Allows.Add('��Ʒ,�����,����������,1');
  tmpTransaction.AddStep(ActJumpToTransN, '1', '', '');

  // Transaction 3
  tmpTransaction := ThisWork.AddTransaction('��ҩ�����У������Ͳ�����');
  tmpPurpose := tmpTransaction.AddPurpose;
  tmpPurpose.Allows.Add('����,�书��,��������');
  tmpTransaction.AddStep(ActUseItem, '�����', '����������', '');
  tmpTransaction.AddStep(ActCreateWG, '', '', '');
  tmpTransaction.AddStep(ActJumpToTransN, '2', '', '');

  // Transaction 4
  tmpTransaction := ThisWork.AddTransaction('ɾ��');
//  tmpTransaction.AddStep(ActDeleteWGs, '5', '��������', '');
  tmpTransaction.AddStep(ActDeleteWGs, '5', '������ϵ��', '2.3');

  // Transaction 5
  tmpTransaction := ThisWork.AddTransaction('����ɾ�к������Ƿ�������');
  tmpPurpose := tmpTransaction.AddPurpose;
  tmpPurpose.Allows.Add('����,�书��,��������');
  tmpTransaction.AddStep(ActJumpToTransN, '3', '', '');

  // Transaction 6
  tmpTransaction := ThisWork.AddTransaction('����');
  tmpTransaction.AddStep(ActCloseItemWindow, '', '', '');

  FormShowWorkTransactions.Show;

  FormMain.BeginWork;
end;

procedure TFormDevelop.Button41Click(Sender: TObject);
begin
  ThisCreateWG.PatchCreateWG;
end;

procedure TFormDevelop.Button42Click(Sender: TObject);
begin
  ThisCreateWG.UnPatchCreateWG;
end;

function TFormDevelop.GetCurrWin: TWindowInfo;
begin
  Result := HLInfoList.GlobalHL.Items[lstWindows.ItemIndex]
end;

end.
