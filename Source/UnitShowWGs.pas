unit UnitShowWGs;

interface

uses
  Windows, Messages, SysUtils, Classes, Grids, StdCtrls, Controls, Forms,
  frmTemplate;

type
  TFormShowWGs = class(TfTemplate)
    StringGridWGs: TStringGrid;
    ButtonHide: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonHideClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowWGs;
  end;

var
  FormShowWGs: TFormShowWGs;

implementation

uses
	UnitClasses, UnitConsts, UnitGlobal, UnitTypesAndVars, ClsGames;

{$R *.dfm}

procedure TFormShowWGs.ShowWGs;
// ˢ���������书��Ϣ
var
  i: integer;
  tmpstr: string;
begin
  ThisUser.GetWGs;
  with StringGridWGs do
  begin
	  for i := 1 to 10 do Rows[i].Clear;	// �������
	  for i := 0 to ThisUser.WGCount - 1 do
  	begin
    	Cells[0, i + 1] := IntToStr(i + 1);       	// ���
	    Cells[1, i + 1] := ThisUser.WGs[i].Name;		// ����
  	  Cells[2, i + 1] := IntToStr(ThisUser.WGs[i].Neili);	// ����

      if ThisUser.WGs[i].Real_DisplayXishuPercent >= 100 then
      	tmpstr := '��'
      else
      	tmpstr := '��';
      Cells[3, i + 1] := tmpstr;            			// ���׶�
      Cells[4, i + 1] := IntToStr(Round(ThisUser.WGs[i].Neili
      	* ThisUser.WGs[i].DisplayXishuMultiply100 / 100)); 	// ɱ��
    	Cells[5, i + 1] := IntToStr(ThisUser.WGs[i].Jingyan);	//����
	  end;
  end;
end;

procedure TFormShowWGs.FormCreate(Sender: TObject);
begin
 	// ���ô���λ��
  self.CFormName := IDS_WGsFormName;
  inherited;

	// ��ʼ����ͷ
  with StringGridWGs do
  begin
  	Cells[0, 0] := 'No.';
	  Cells[1, 0] := '��ʽ����';
  	Cells[2, 0] := '����';
	  Cells[3, 0] := '����';
  	Cells[4, 0] := 'ɱ��';
	  Cells[5, 0] := '����';
  end;
end;

procedure TFormShowWGs.ButtonHideClick(Sender: TObject);
begin
  Close;
end;

procedure TFormShowWGs.FormShow(Sender: TObject);
begin
  Caption := '��ʾ�书��' + HLInfoList.GlobalHL.UserName;
end;

end.
