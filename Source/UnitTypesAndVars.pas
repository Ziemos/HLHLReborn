unit UnitTypesAndVars;
                                                                    
interface

uses
  Windows, Classes, UnitConsts, ClsMaps;

Type
  DijksatraNodeInfo = ^TDijksatraNode;

  TDijksatraNode = record
    PosInMapList: DWord;
    MapID: DWORD;
    priorNode: TNodeInfo;
    priorDijksatraNode: DijksatraNodeInfo;
    distance: integer;
    OutNodes: TList;
  end;

  TItem = record
    Name: String;
    Maker: String;
    Level: DWORD;
    Price: DWORD;
    ID: DWORD;
    ItemType: WORD;
    PlusLife: SmallInt;
    PlusNeili: SmallInt;
    PlusGongji: SmallInt;
    PlusFangyu: SmallInt;
    PlusMinjie: SmallInt;
    PlusDufang: SmallInt;
    PlusDingfang: SmallInt;
    PlusShuifang: SmallInt;
    PlusHunfang: SmallInt;
  end;

  TWG = record
    Name: String; // ����
    Creator: String; // ������
    ID: DWORD; // �书ID
    QS: DWORD; // ����
    GJ: DWORD; // �켣
    BZ: DWORD; // ��ը
    LevelNeed: DWORD; // �ȼ�
    Neili: DWORD; // ����
    DisplayXishuMultiply100: DWORD; // ��ʾϵ�� * 100
    Real_DisplayXishuPercent: DWORD; // ʵ��ϵ������ʾϵ���İٷֱȣ�>= 100Ϊ������
    Jingyan: DWORD; // ����
  end;

  TCreature = record
    Data: array [0..CreatureInfoSize-1] of Byte;
    ID: DWORD;
    Name: String;
    Level: WORD;
    State: Byte; // Dead=$65, Poison=$66, Freeze=$67, Sleep=$68, Chaos=$69, Over=$6A;
    IsDead: Boolean;
  end;

  CreatureInfo = ^TCreature;

  TFate = record
    Attr: Integer;
    Rank: Integer;
    Level: Integer;
    PosX: Integer;
    PosY: Integer;
    MapID: DWORD;
    StepIndex: integer;
    StepNum: Integer;
    StepList: TList;
    OldNPCDialog: String;
  end;

  TPet = record
    Name: String;
    ID: DWORD;
    Level: WORD;
    Loyal: WORD;
    Experience: DWORD;
    NextLevel: DWORD;
    MaxLife: DWORD;
    CurrLife: DWORD;
    Attack: DWORD;
    Defence: DWORD;
    Dexterity: DWORD;
    MedalAttack: DWORD;
    MedalDefence: DWORD;
    MedalDexterity: DWORD;
  end;

  TPurpose = record // �������Allows֮����OR�Ĺ�ϵ
    Allows: TStringList;
    isSatisfied: Boolean;
  end;

  PurposeInfo=^TPurpose;

  TStoveStuff = record
    StuffID: DWORD;
    StuffAttr: DWORD;
  end;

  TStoveInstruction = record
    Stuffs: array [0..7] of TStoveStuff;
    MainStuffPos: integer;
  end;

  TAllowedStuffType = record
    Name: String;
    Attr: Word;
    Maker: String;
  end;

  AllowedStuffTypeInfo = ^TAllowedStuffType;

  TStoveRoom = record
    Stuff: TStoveStuff;
    AllowedStuffTypes: TList;
  end;

  TStove = record
    Rooms: array [0..7] of TStoveRoom;
    MainRoomPos: integer;
    tmpID1: DWORD;
    tmpID2: DWORD;  // Ϊ��֪���Ƿ��Ѿ������ɹ�
  end;

  StoveInfo=^TStove;
  
  TStoveStuffToBeChozen = record
    Stuff: TItem;
    ChozenBy: Integer; // ��˭Chozen�ˣ������-1����û�б�Chozen
  end;

  TPStoveStuffToBeChozen = ^TStoveStuffToBeChozen;

  TNPC = record
//    UserCurrMapID: DWORD;
    ShopMapID: DWORD;
    ShopType: BYTE; //  $64-������, $65-ҩ��, $66-�鱦��, $67-�����
    Name: String;
    SatisfiedCond: String; // �����Shop�����Ǵ򿪴��ڵ�Title, ����ǶԻ�NPC������Dialog
  end;

  TCallNPCState = record
    UserCurrMapID: DWORD;
    IsWorking: Boolean;
  end;

  TWGAttrs = record
    MC: String; // �书����
    XS: String; // ɱ��ϵ��
    NL: String; // ��������
    QS: String; // ��������
    GJ: String; // ���й켣
    BZ: String; // ��ը��ʽ
  end;

var
//  ThisFate: TFate;
  ThisTrans: TTransportInfo;
  CallNPCState: TCallNPCState;
  ThisWGAttrs: TWGAttrs;

  TimeToSleep: Integer = 400; // ��΢��Ϊ��λ

  StoveInstruction: TStoveInstruction;

  StoveRooms: array [0..7] of string=('Ǭ����', '�ҡ���', '�롤��', '��ľ', '�㡤ľ', '����ˮ', '�ޡ���', '������');

//  NPCIDsArray: array [0..Ord(High(TNPCID))] of TNPCID;

  NPCs: array [0..Ord(High(TNPCID))] of TNPC; 	// NPC ��Ϣ

implementation

end.
