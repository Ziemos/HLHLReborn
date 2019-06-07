unit UnitShowWorkTransactions;
// ���ֻ��顤��ʾ��������
interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  StdCtrls, Grids, frmTemplate;

type
  TFormShowWorkTransactions = class(TfTemplate)
    StringGridTransactions: TStringGrid;
    ButtonHide: TButton;
    lblRepeatCount: TLabel;
    procedure ButtonHideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowTransactions;
  end;

var
  FormShowWorkTransactions: TFormShowWorkTransactions;

implementation

{$R *.dfm}
uses
	UnitGlobal, UnitConsts, UnitTypesAndVars, UnitClasses, ClsGames;

procedure TFormShowWorkTransactions.ShowTransactions;
const
	MinRowCount = 10;
var
  i:integer;
  tmpTransaction: TTransaction;
begin
  if not self.Visible then Exit;
	// ������������
  if ThisWork.Count > MinRowCount then
    StringGridTransactions.RowCount := ThisWork.Count + 1
  else
  begin
    StringGridTransactions.RowCount := MinRowCount + 1;
  	// �����������Ϣ
	  for i := 1 to StringGridTransactions.RowCount - 1 do
  		StringGridTransactions.Rows[i].Clear;
	end;
  StringGridTransactions.Row := 1;
  
  with StringGridTransactions do
  for i := 0 to ThisWork.Count - 1 do
  begin
    tmpTransaction := ThisWork.GetTransactionByIndex(i);
    if tmpTransaction = ThisWork.GetCurrTransaction then
    	StringGridTransactions.Row := i + 1;
    Cells[0, i + 1] := IntToStr(i);		// ������
    Cells[1, i + 1] := tmpTransaction.Caption;	// ����˵��
    if tmpTransaction.State = 1 then	// ִ��״̬
    	Cells[2, i + 1] := '��'
    else if tmpTransaction.State = -1 then
    	Cells[2, i + 1] := '��';
  end;

  if ThisWork.RepeatCount = -1 then
    lblRepeatCount.Caption := Format('����ѭ���������ǵ�%d��', [ThisWork.RepeatCounter + 1])
  else
    lblRepeatCount.Caption := Format('����Ҫѭ��%d�Σ������ǵ�%d��',
    	[ThisWork.RepeatCount, ThisWork.RepeatCounter + 1]);
end;

procedure TFormShowWorkTransactions.ButtonHideClick(Sender: TObject);
begin
  Close;
end;

procedure TFormShowWorkTransactions.FormCreate(Sender: TObject);
begin
 	// ���ô���λ��
  self.CFormName := IDS_WorkTransactionsFormName;
  inherited;
  //���ñ�ͷ
  with StringGridTransactions do
  begin
  	Cells[0, 0] := 'No.';
	  Cells[1, 0] := '��Ϊ����';
  	Cells[2, 0] := 'OK';
  end;
end;

procedure TFormShowWorkTransactions.FormShow(Sender: TObject);
begin
  Caption := '��ʾ�������衤' + HLInfoList.GlobalHL.UserName;
  ShowTransactions;
end;

end.
