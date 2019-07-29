unit ClsGames;

interface
uses
  Windows, Contnrs, Forms; //SysUtils
Type
  THotKeyInfo = Class
  private
    FID: Integer;
    FIniFileName: WideString;
    FInfoName: WideString;
    FVirtualKey: WORD;
    FModifiers: UINT;
    FShowText: WideString;
  public
    constructor Create(const InfoName: WideString);
    destructor Destroy; override;
    property ID: Integer read FID;
    property IniFileName: WideString read FIniFileName write FIniFileName;
    property Modifiers: UINT read FModifiers write FModifiers;
    property VirtualKey: Word read FVirtualKey write FVirtualKey;
    property ShowText: WideString read FShowText write FShowText;
    procedure ReadHotKeyInfo;
    function RegisterHotKey(FormHandle: THandle): Boolean;
    function UnRegisterHotKey(FormHandle: THandle): Boolean;
    procedure WriteHotKeyInfo;
  end;
  TWindowInfo = Class;

  THLUser = Class;

  THLInfo = class(TObjectList)
    ProcessId: LongWord;
    UserNick: WideString;   // �º�
    UserSpouse: WideString; // ��ż
  private
    FMainHotKeyInfo: THotKeyInfo;
    FUser: THLUser;
    FUserName: WideString;   // ����
    FWinInfoHotKeyInfo: THotKeyInfo;
    function GetItem(Index: Integer): TWindowInfo;
    procedure SetItem(Index: Integer; const Value: TWindowInfo);
    function GetIniFileName: WideString;
    procedure SetUserName(const Value: WIdeString);
  public
    constructor Create;
    destructor Destroy; override;
    procedure DeepGetWindow(hCurrentWindow: HWND;
      ParentWindow: TWindowInfo; sPrefix: WideString);
    property IniFileName: WideString read GetIniFileName;
    function ItemOfWindowID(const WindowID: LongWord): TWindowInfo;
    function ItemOfWindowTitle(const SubTitle: WideString): TWindowInfo;
    property Items[Index: Integer]: TWindowInfo read GetItem write SetItem; default;
    procedure LoadFormAttribute(const FormNameStr: string; f: TForm);
    function LocateChildWindowWNDByTitle(hwndParentWin: HWND;
      const SubTitle: WideString; const isDirectChild: Boolean): HWND; overload;
    function LocateChildWindowWNDByTitle(ParentWinInfo: TWindowInfo;
      const SubTitle: WideString; const isDirectChild: Boolean): HWND; overload;
    function LocateChildWindowInfoByTitle(hwndParentWin: HWND;
      const SubTitle: WideString; const isDirectChild: Boolean): TWindowInfo; overload;
    function LocateChildWindowInfoByTitle(ParentWinInfo: TWindowInfo;
      const SubTitle: WideString; const isDirectChild: Boolean): TWindowInfo; overload;
    function LocateToMainPanel: Integer;
    function LocateToPlayWindow(var wPlayWindow: TWindowInfo): Integer;
    property MainHotKeyInfo: THotKeyInfo read FMainHotKeyInfo;
    function ReCalWin: Integer;
    procedure SaveFormAttribute(const FormNameStr: Widestring; f: TForm);
    property User: THLUser read FUser;
    property UserName: WIdeString read FUserName write SetUserName;
    procedure WaitWindowDisAppearbyHwnd(const myHwnd: HWND);
    procedure WaitWindowDisAppearbyTitle(const SubTitle: WideString);
    property WinInfoHotKeyInfo: THotKeyInfo read FWinInfoHotKeyInfo;
  end;

  THLInfoList = class(TObjectList)
  private
    FSelectIndex: Integer;
    function GetItem(Index: Integer): THLInfo;
    procedure SetItem(Index: Integer; const Value: THLInfo);
    function GetCurrHLInfo: THLInfo;
    procedure SetSelectIndex(const Value: Integer);
  public
    constructor Create;
    property Items[Index: Integer]: THLInfo read GetItem write SetItem; default;
    property SelectIndex: Integer write SetSelectIndex;
    property GlobalHL: THLInfo read GetCurrHLInfo;
  end;
  
  THLUser = Class
  private
    FHLInfo: THLInfo;
  public
    constructor Create(aObj: THLInfo);
  end;

  TWindowInfo = Class
    Prefix    : WideString;
    Title     : WideString;
    ClassName : WideString;
    Window    : LongWord; //HWND;
    ParentWin : TWindowInfo;
    Left      : LongInt;
    Right     : LongInt;
    Top       : LongInt;
    Bottom    : LongInt;
  end;
var
  HLInfoList: THLInfoList;
implementation
uses
  UnitConsts, IniFiles;
{ THL_Info }

constructor THLInfo.Create;
begin
  inherited;
  FUser := THLUser.Create(self);
  FMainHotKeyInfo := THotKeyInfo.Create(IDS_MainHotKeyInfo);
  FWinInfoHotKeyInfo := THotKeyInfo.Create(IDS_WinInfoHotKeyInfo);
end;

procedure THLInfo.DeepGetWindow(hCurrentWindow: HWND;
  ParentWindow: TWindowInfo; sPrefix: WideString);
// �����ȡ������Ϣ
var
  hChildCW, hNext: HWnd;
  szText: array[0..254]of char;
  WinRect: TRECT;
  MyWin: TWindowInfo;
  tmpPrefix: String;
begin
  hCurrentWindow := GetWindow(hCurrentWindow, GW_HWNDFIRST);

  While hCurrentWindow <> 0 Do
  Begin
    GetWindowText(hCurrentWindow, @szText, 255);
    GetWindowRect(hCurrentWindow, WinRect);

    MyWin := TWindowInfo.Create;
    with MyWin do
    begin
      Prefix := sPrefix;
      Title := szText;
      Window := hCurrentWindow;
      ParentWin := ParentWindow;
      Top := WinRect.Top;
      Left := WinRect.Left;
      Bottom := WinRect.Bottom;
      Right := WinRect.Right;

      GetClassName(hCurrentWindow, @szText, 255);
      ClassName := szText;
    end;
    hChildCW := GetWindow(hCurrentWindow, GW_CHILD);

    hNext := GetWindow(hCurrentWindow, GW_HWNDNEXT);

    if hNext <> 0 then begin
      MyWin.Prefix := MyWin.Prefix + '��';
      tmpPrefix := sPrefix + '��';
    end else begin
      MyWin.Prefix := MyWin.Prefix+'��';
      tmpPrefix := sPrefix + '  ';
    end;

    Self.Add(mywin);

    if hChildCW <> 0 then
      DeepGetWindow(hChildCW, MyWin, tmpPrefix);

    hCurrentWindow := hNext;
  end;
end;

destructor THLInfo.Destroy;
begin
  FUser.Free;
  FMainHotKeyInfo.Free;
  FWinInfoHotKeyInfo.Free;
  inherited;
end;

function THLInfo.GetIniFileName: WideString;
begin
  Result := IDS_UsersPath + UserName + '.Ini';
end;

function THLInfo.GetItem(Index: Integer): TWindowInfo;
begin
  Result := TWindowInfo(inherited Items[Index]);
end;

function THLInfo.ItemOfWindowID(const WindowID: LongWord): TWindowInfo;
// ���ݱ�Ų��Ҵ���
var
  i: Integer;
begin
  ReCalWin;
  for i := 0 to Self.Count - 1 do
  begin
    Result := Self.Items[i];
    if Result.Window = WindowID then
      Exit;
  end;
  Result := nil;
end;

function THLInfo.ItemOfWindowTitle(
  const SubTitle: WideString): TWindowInfo;
// ���ݱ�����Ҵ���
var
  i: Integer;
begin
  ReCalWin;
  for i := 0 to Self.Count - 1 do
  begin
    Result := Self.Items[i];
    if SubTitle = Result.Title then
      Exit;
  end;
  Result := nil;
end;

procedure THLInfo.LoadFormAttribute(const FormNameStr: string; f: TForm);
// װ�ش�������
var
	iTmp: integer;
begin
	with TIniFile.Create(self.IniFileName) do	// ��������
  try
  	// ���ô���λ��
  	iTmp := ReadInteger(FormNameStr, IDS_FormTopStr, 0);
    if (iTmp <= 0) or (iTmp >= Screen.DesktopHeight) then iTmp := 0;
    f.Top := iTmp;
  	iTmp := ReadInteger(FormNameStr, IDS_FormLeftStr, 0);
    if (iTmp <= 0) or (iTmp >= Screen.DesktopWidth) then iTmp := 0;
    f.Left := iTmp;
	finally
  	Free;
  end;
end;

function THLInfo.LocateChildWindowInfoByTitle(hwndParentWin: HWND;
  const SubTitle: WideString; const isDirectChild: Boolean): TWindowInfo;
// ��λһ���Ӵ��ڣ���һ����ֱ���Ӵ��ڣ�
var
  i: integer;
  tmpWin, tmpRecursionWin: TWindowInfo;
begin
  ReCalWin;
  Result := nil;
  for i := 0 to Self.Count - 1 do
  begin
    tmpWin := Self.Items[i];
    if (SubTitle <> tmpWin.Title) and (SubTitle <> '') then
      Continue; // Title û��Ӧ��

    if isDirectChild then
    begin // �Խ��Ӵ���
      if tmpWin.ParentWin = nil then
      begin
        if hwndParentWin = 0 then  // �����ָ���޸�����
        begin
          Result := tmpWin;
          Exit;
        end;
        Continue;
      end;

      if tmpWin.ParentWin.Window = hwndParentWin then
      begin
        Result := tmpWin;
        Exit;
      end;
    end else begin // ����Ӵ���
      tmpRecursionWin := tmpWin;
      // ����Ƿ�ΪParentWin��ĳ���Ӵ���
      while tmpRecursionWin.ParentWin <> nil do
        if tmpRecursionWin.ParentWin.Window = hwndParentWin then
        begin
          Result := tmpWin;
          Exit;
        end
        else
          tmpRecursionWin := tmpRecursionWin.ParentWin;
    end;
  end; {for}
end;

function THLInfo.LocateChildWindowInfoByTitle(ParentWinInfo: TWindowInfo;
  const SubTitle: WideString; const isDirectChild: Boolean): TWindowInfo;
// ��λһ���Ӵ��ڣ���һ����ֱ���Ӵ��ڣ�
begin
  Result := LocateChildWindowInfoByTitle(ParentWinInfo.Window, SubTitle, isDirectChild);
end;

function THLInfo.LocateChildWindowWNDByTitle(hwndParentWin: HWND;
  const SubTitle: WideString; const isDirectChild: Boolean): HWND;
// ��λһ���Ӵ��ڣ���һ����ֱ���Ӵ��ڣ�
var
  tmpWin: TWindowInfo;
begin
  tmpWin := LocateChildWindowInfoByTitle(hwndParentWin, SubTitle, isDirectChild);
  if tmpWin = nil then
    Result := 0
  else
    Result := tmpWin.Window;
end;

function THLInfo.LocateChildWindowWNDByTitle(ParentWinInfo: TWindowInfo;
  const SubTitle: WideString; const isDirectChild: Boolean): HWND;
// ��λһ���Ӵ��ڣ���һ����ֱ���Ӵ��ڣ�
begin
  Result := LocateChildWindowWNDByTitle(ParentWinInfo.Window, SubTitle, isDirectChild);
end;

function THLInfo.LocateToMainPanel: Integer;
// ��λ�������
var
  i: Integer;
  winApp: TWindowInfo;
begin
  ReCalWin;
  Result := -1;
  winApp := nil;
  for i := 0 to Self.Count - 1 do
  begin
    if Pos(WideString('Monster&Me - '), Self.Items[i].Title) <> 0 then
    begin
      winApp := Self.Items[i];
    end;
    if winApp <> nil then
    begin
      if Self.Items[i].Title = PnlMainTitle then
      begin
        Result := i;
        Break;
      end;
    end;
  end;
end;

function THLInfo.LocateToPlayWindow(var wPlayWindow: TWindowInfo): Integer;
// Locate and return game window.
var
  i, MainLeft, MainRight, MainTop, MainBottom: Integer;
  tmpWin: TWindowInfo;

  myFile: TextFile;
  text: string;
begin
  Result := -1;
  wPlayWindow := nil;
  if ReCalWin = 0 then Exit;

  //memory address of handle 66C0BC
  //AssignFile(myFile, 'Test.txt');
  //ReWrite(myFile);

  i := 0;
  repeat
    tmpWin := self.Items[i];
    // Find main form
    //if Pos(AnsiString('Monster&Me - '), tmpWin.Title) <> 0 then
    if tmpWin.ClassName = 'TFormMain' then
    begin
      MainLeft := tmpWin.Left;
      MainRight := tmpWin.Right;
      MainTop := tmpWin.Top;
      MainBottom := tmpWin.Bottom;
      Result := i;
      wPlayWindow := tmpWin;
      Exit;
      Break;
    end;
    Inc(i);
  until i > self.Count - 1;
  if i > self.Count - 1 then
  begin
    //CloseFile(myFile);
    Exit;
  end ;


  i := 0;
  repeat
    tmpWin := self.Items[i];
    // Locate game form?
    if (tmpWin.Left - PlayLeftJust = MainLeft)
      and (tmpWin.Right - PlayRightJust = MainRight)
      and (tmpWin.Top - PlayTopJust = MainTop)
      and (tmpWin.Bottom - PlayBottomJust = MainBottom)
    then begin
      tmpWin.Left := MainLeft + PlayLeftJust;
      tmpWin.Top := MainTop + PlayTopJust;
      Result := i;
      wPlayWindow := tmpWin;
      Break;
    end;
    //text := tmpWin.Prefix + ' ' + tmpWin.Title + ' ' + tmpWin.ClassName;
    //text := text + '[' + IntToStr(tmpWin.Left) + ',' + IntToStr(tmpWin.Top) + ',' + IntToStr(tmpWin.Right) + ',' + IntToStr(tmpWin.Bottom) + ']';
    //WriteLn(myFile, text);
    Inc(i);
  until i > self.Count - 1;
  //CloseFile(myFile);
end;

function THLInfo.ReCalWin: Integer;
// �����ҵ����ڵĸ���
var
  hCurrentWindow, hChildCW: HWnd;
  tmpProcID: DWORD;
  szText: array [0..254] of char;
  WinRect: TRECT;
  tmpPrefix: WideString;
  MyWin: TWindowInfo;
begin
  // ����ԭ�еĴ�����Ϣ
  Self.Clear;
  hCurrentWindow := FindWindow('Progman', nil);
  hCurrentWindow := GetWindow(hCurrentWindow, GW_HWNDFIRST);
  While hCurrentWindow <> 0 Do
  Begin
    GetWindowThreadProcessId(hCurrentWindow, @tmpProcID);
    if tmpProcID = Self.ProcessId then
    begin
      GetWindowText(hCurrentWindow, @szText, 255);
      GetWindowRect(hCurrentWindow, WinRect);
      MyWin := TWindowInfo.Create;
      with MyWin do
      begin
        if IsWindowVisible(hCurrentWindow) then
          Prefix := '��'
        else
          Prefix := '��';

        Title := szText;
        Window := hCurrentWindow;
        ParentWin := nil;
        Top := WinRect.Top;
        Left := WinRect.Left;
        Bottom := WinRect.Bottom;
        Right := WinRect.Right;
        GetClassName(hCurrentWindow, @szText, 255);
        ClassName := szText;
      end;
      Self.Add(MyWin);

      hChildCW := GetWindow(MyWin.Window, GW_CHILD);
      tmpPrefix := '  ';
      if hChildCW <> 0 then
        DeepGetWindow(hChildCW, MyWin, tmpPrefix);
    end;
    hCurrentWindow := GetWindow(hCurrentWindow, GW_HWNDNEXT);
  end;
  Result := Self.Count;
end;

procedure THLInfo.SaveFormAttribute(const FormNameStr: Widestring; f: TForm);
// ���洰������
begin
	with TIniFile.Create(self.IniFileName) do	// ��������
  try
  	// ���洰��λ��
  	WriteInteger(FormNameStr, IDS_FormTopStr, f.Top);
  	WriteInteger(FormNameStr, IDS_FormLeftStr, f.Left);
	finally
  	Free;
  end;
end;

procedure THLInfo.SetItem(Index: Integer; const Value: TWindowInfo);
begin
  inherited Items[Index] := Value;
end;

procedure THLInfo.SetUserName(const Value: WIdeString);
begin
  FUserName := Value;
  with self.MainHotKeyInfo do
  begin
    IniFileName := Self.IniFileName;
    ReadHotKeyInfo;
  end;

  with self.WinInfoHotKeyInfo do
  begin
    IniFileName := Self.IniFileName;
    ReadHotKeyInfo;
  end;
end;

procedure THLInfo.WaitWindowDisAppearbyHwnd(const myHwnd: HWND);
// �ȴ�ָ������Ĵ�����ʧ
var
  tmp: Boolean;
  i: Integer;
  tmpWin: TWindowInfo;
begin
  repeat
    tmp := True;
    ReCalWin;
    for i := 0 to Self.Count-1 do
    begin
      tmpWin := Self.Items[i];

      if myHwnd = tmpWin.Window then
      begin
        tmp := False;
        Break;
      end;
    end;
    Sleep(100);
  until tmp;
end;

procedure THLInfo.WaitWindowDisAppearbyTitle(const SubTitle: WideString);
// �ȴ�ָ������Ĵ�����ʧ
var
  tmp: Boolean;
  i: Integer;
  tmpWin: TWindowInfo;
begin
  repeat
    tmp := True;
    ReCalWin;
    for i := 0 to Self.Count - 1 do
    begin
      tmpWin := self.Items[i];

      if SubTitle = tmpWin.Title then
      begin
        tmp := False;
        Break;
      end;
    end;
    Sleep(100);
  until tmp;
end;

{ THL_InfoList }

constructor THLInfoList.Create;
begin
  inherited;
  self.FSelectIndex := -1;
end;

function THLInfoList.GetCurrHLInfo: THLInfo;
begin
  if (FSelectIndex > self.Count - 1) or (FSelectIndex < 0)then
    Result := nil
  else
    Result := self.Items[FSelectIndex];
end;

function THLInfoList.GetItem(Index: Integer): THLInfo;
begin
  Result := THLInfo(inherited Items[Index]);
end;

procedure THLInfoList.SetItem(Index: Integer; const Value: THLInfo);
begin
  inherited Items[Index] := Value;
end;

procedure THLInfoList.SetSelectIndex(const Value: Integer);
begin
  if (Value > self.Count - 1) or (Value < -1)then
    FSelectIndex := -1
  else
    FSelectIndex := Value;
end;

{ THLUser }

constructor THLUser.Create(aObj: THLInfo);
begin
  FHLInfo := aObj;
end;

{ THotKeyInfo }

constructor THotKeyInfo.Create(const InfoName: WideString);
var
  tmpS: string;
begin
  inherited Create();
  self.FInfoName := InfoName;
  // ����ȫ������
  tmpS := 'HLHL' + InfoName;
  FID := GlobalAddAtom(PChar(tmpS)) - $C000;
end;

destructor THotKeyInfo.Destroy;
begin
  // ����ȫ������
  DeleteAtom(FID);
  inherited;
end;

procedure THotKeyInfo.ReadHotKeyInfo;
// װ���ȼ������������
begin
	with TIniFile.Create(FIniFileName) do // �ȼ�
	try
    FVirtualKey := ReadInteger(FInfoName, IDS_VirtualKey, 0);
    FModifiers := ReadInteger(FInfoName, IDS_Modifiers, 0);
    FShowText := ReadString(FInfoName, IDS_ShowText, '');
  finally
  	Free;
  end;
end;

function THotKeyInfo.RegisterHotKey(FormHandle: THandle): Boolean;
//  ע���ȼ�
begin
  Windows.RegisterHotkey(FormHandle, FID, FModifiers, FVirtualKey);
end;

function THotKeyInfo.UnRegisterHotKey(FormHandle: THandle): Boolean;
// ע���ȼ�
begin
  Windows.UnRegisterHotkey(FormHandle, FID);
end;

procedure THotKeyInfo.WriteHotKeyInfo;
// �����ȼ������������
begin
 	with TIniFile.Create(self.FIniFileName) do // �ȼ�
  try
   	WriteInteger(FInfoName, IDS_VirtualKey, FVirtualKey);
   	WriteInteger(FInfoName, IDS_Modifiers, FModifiers);
    WriteString(FInfoName, IDS_ShowText, FShowText);
  finally
	  Free;
  end;
end;

initialization
	HLInfoList := THLInfoList.Create;
finalization
	HLInfoList.Free;
end.
