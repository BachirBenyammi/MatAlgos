unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, IniFiles;

type
  TForm1 = class(TForm)
    OD: TOpenDialog;
    SD: TSaveDialog;
    Button2: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    MatRes: TStringGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Matrice: TStringGrid;
    Label1: TLabel;
    Edit_Count: TEdit;
    BtnFixer: TBitBtn;
    BtnAjouter: TButton;
    Edit_Value: TEdit;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Edit_Long: TEdit;
    Button6: TButton;
    Lab_Nbr_Cir: TLabel;
    Button7: TButton;
    Grid: TStringGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnFixerClick(Sender: TObject);
    procedure BtnAjouterClick(Sender: TObject);
    procedure Edit_CountKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_ValueKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  Public
    procedure Effacer_Matrice (var Table: TStringGrid);
    procedure Fixer_Matrice(var Table: TStringGrid; N: integer);
    procedure Initial_Matrice(var Table: TStringGrid; N: integer);
    procedure Lecture_Matrice (Source: String; var Table: TStringGrid);
    procedure Ecriture_Matrice (Destination: String; Table: TStringGrid);
    procedure Prod_Mat(Table1, Table2: TStringGrid; var Table_Dest : TStringGrid);
    function Nbr_Cir(Table: TStringGrid; Long: integer):integer;
//    procedure Calc_Distance;
    procedure Alg_Ferm_Trans (Table_Src: TStringGrid; var Table_Dest : TStringGrid);
    procedure Algo_Gra_Inverse(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
    procedure Algo_Mat_Inverse(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
    procedure Algo_Gra_Comp(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
    procedure Algo_Mat_Comp(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
  end;

var
  Form1: TForm1;

implementation

uses UFerTrans;



{$R *.dfm}

procedure TForm1.Prod_Mat(Table1, Table2: TStringGrid; var Table_Dest : TStringGrid);
var
  i, j, k,s,N: integer;
begin
  N := Table1.ColCount;
  Grid.ColCount := N;
  Grid.RowCount := N;
  for i:= 1 to N-1 do
    for j:= 1 to N-1 do
      Grid.Cells[j,i] := '0';

  Fixer_Matrice(Table_Dest,N-1);      
  for i:= 1 to N-1 do
    for j:= 1 to N-1 do
      begin
        s:= 0;
        for k:= 1 to N-1 do
          s := s + (StrToInt(Table1.Cells[k,i]) * StrToInt(Table2.Cells[j,k]));
          Grid.Cells[j,i] := intToSTr(s);
      end;
  for i:= 1 to N-1 do
    for j:= 1 to N-1 do
      Table_Dest.Cells[j,i] := Grid.Cells[j,i];
end;

{procedure TForm1.Calc_Distance;
var
  Mat, Mat1, Mat2, Mat3, Mat4, Mat5 : TStringGrid;
  i,j, N: integer;
begin
  for i:=1 to N  do
    for j:=1 to N  do
      if Mat.Cells[i,j] = '0' then
        if Mat2.Cells[i,j] = '0' then
          if Mat3.Cells[i,j] = '0' then
            if Mat4.Cells[i,j] = '0' then
              if Mat5.Cells[i,j] = '0' then
                Grid.Cells[i,j] := '-1'
              else Grid.Cells[i,j] := '5'
            else Grid.Cells[i,j] := '4'
          else Grid.Cells[i,j] := '3'
        else Grid.Cells[i,j] := '2'
      else Grid.Cells[i,j] := '1';
  for i:=1 to N-1 do
    Grid.Cells[i,i] := '0';
end;   }

function TForm1.Nbr_Cir (Table: TStringGrid; Long: integer):integer;
var
  i, j,N, s:integer;
begin
  s:=0;
  N := Table.ColCount;
  MatRes.ColCount := N;
  MatRes.RowCount := N;

  for i:= 1 to N-1 do
    for j:= 1 to N-1 do
      MatRes.Cells[j,i] := Table.Cells[j,i];

  for i:= 1 to Long-1 do
    Prod_Mat(Table, MatRes, MatRes);

  for i:= 1 to N-1 do
    s := s + StrToInt(MatRes.Cells[i,i]);
  Nbr_Cir := s;
end;

procedure TForm1.Fixer_Matrice(var Table: TStringGrid; N: integer);
var
  i: integer;
begin
  Table.ColCount := N+1;
  Table.RowCount := N+1;
  for i:= 1 to N do
    begin
      Table.Cells[i,0] := IntToStr(i-1);
      Table.Cells[0,i] := IntToStr(i-1);
    end;
end;

procedure TForm1.Initial_Matrice(var Table: TStringGrid; N: integer);
var
  i, j: integer;
begin
  for i:= 1 to N-1 do
    for j:= 1 to N-1 do
    begin
      Table.Cells[i,j] := IntToStr(0);
    end;
end;

procedure TForm1.Algo_Gra_Inverse(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
var
  N, i, j: integer;
begin
  N := Table_Src.ColCount;
  Effacer_Matrice(Table_Dest);
  Initial_Matrice(Table_Dest,N);
  Fixer_Matrice(Table_Dest, N-1);
  for i:= 1 to N-1 do
    if Table_Src.Cells[i,i] = IntToStr(1) then
       Table_Dest.Cells[i,i] := IntToStr(1);
  for i:=1 to N-1 do
    for j:= 1 to N-1 do
      if i <> j then
        Table_Dest.Cells[i,j] := Table_Src.Cells[j,i];
end;

procedure TForm1.Algo_Mat_Inverse(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
var
  N, i, j: integer;
begin
  N := Table_Src.ColCount;
  Effacer_Matrice(Table_Dest);
  Initial_Matrice(Table_Dest,N);
  Fixer_Matrice(Table_Dest, N-1);
  for i:=1 to N-1 do
    for j:= 1 to N-1 do
        Table_Dest.Cells[i,j] := Table_Src.Cells[j,i];
end;

procedure TForm1.Algo_Gra_Comp(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
var
  N, i, j: integer;
begin
  N := Table_Src.ColCount;
  Effacer_Matrice(Table_Dest);
  Fixer_Matrice(Table_Dest, N-1);
  for i:=1 to N-1 do
    for j:= 1 to N-1 do
     if Table_Src.Cells[j,i] = '1' then
      Table_Dest.Cells[j,i] := '0'
     else
      Table_Dest.Cells[j,i] := '1';
end;

procedure TForm1.Algo_Mat_Comp(Table_Src: TStringGrid; var Table_Dest : TStringGrid);
var
  N, i, j: integer;
begin
  N := Table_Src.ColCount;
  Effacer_Matrice(Table_Dest);
  Fixer_Matrice(Table_Dest, N-1);
  for i:=1 to N-1 do
    for j:= 1 to N-1 do
      Table_Dest.Cells[j,i] := IntToStr(1 - StrToInt(Table_Src.Cells[j,i]));
end;

procedure TForm1.Alg_Ferm_Trans (Table_Src: TStringGrid; var Table_Dest : TStringGrid);
var
  i,j,k, N : integer;
begin
  Effacer_Matrice(Table_Dest);
  N := Table_Src.ColCount;
  Fixer_Matrice(Table_Dest, N-1);

  for i:= 1 to N-1 do
    for j:=1 to N-1 do
     Table_Dest.Cells[i,j] := Table_Src.Cells[i,j];

  for i:= 1 to N-1 do
    for j:= 1 to N-1 do
      if StrToInt(Table_Dest.Cells[i,j]) = 1 then
          for k:= 1 to N-1 do
            if StrToInt(Table_Dest.Cells[k,i]) = 1 then
              Table_Dest.Cells[k,j] := IntToStr(1);

end;

procedure TForm1.Ecriture_Matrice (Destination: String; Table: TStringGrid);
var
  Fichier : TIniFile;
  N, i, j: integer;
begin
  N := Table.ColCount-1;
  Fichier := TIniFile.Create(Destination);
  try
    Fichier.WriteString('Taille','N',IntToStr(N));
    for i:= 1 to N do
      for j:= 1 to N do
        Fichier.WriteString('Ligne'+ IntToStr(i-1),'Tab['+IntToStr(i-1)+','+IntToStr(j-1)+']',Table.Cells[j,i]);
  finally
    Fichier.Free;
  end;
end;

procedure TForm1.Lecture_Matrice (Source: String; var Table: TStringGrid);
var
  Fichier : TIniFile;
  N, i, j: integer;
begin
  Fichier := TIniFile.Create(OD.Filename);
  try
    N := StrToInt(Fichier.ReadString('Taille','N','2'));
    Fixer_Matrice(Table, N);
    for i:= 1 to N do
     for j:= 1 to N do
      Table.Cells[j,i] := Fichier.ReadString('Ligne'+ IntToStr(i-1),'Tab['+IntToStr(i-1)+','+IntToStr(j-1)+']','0');
  finally
    Fichier.Free;
  end;
end;

procedure TForm1.Effacer_Matrice (var Table: TStringGrid);
var
  N, i, j: integer;
begin
  N := Table.ColCount;
  for i:=0 to N-1 do
    for j:=0 to N-1 do
      Table.Cells[i,j] := '';
  Fixer_Matrice(Table, 1);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if OD.Execute then
    Lecture_Matrice(od.FileName, Matrice);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if SD.Execute then
    Ecriture_Matrice(SD.FileName, Matrice);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Effacer_Matrice (Matrice);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Alg_Ferm_Trans(Matrice, MatRes);
end;

procedure TForm1.BtnFixerClick(Sender: TObject);
begin
  Fixer_Matrice(Matrice,StrToInt(Edit_Count.Text));
  Edit_Value.SetFocus
end;

procedure TForm1.BtnAjouterClick(Sender: TObject);
var
  N, i, j: integer;
begin
  N := Matrice.ColCount;
  for i := 1 to N-1 do
    for j:= 1 to N-1 do
      if Length(Matrice.Cells[j,i]) <= 0 then
        begin
          Matrice.Cells[j,i] := Edit_Value.Text;
          Edit_Value.Clear;
          Edit_Value.SetFocus;
          Exit;
        end;
  MessageDlg('Pas de case vide disponile !!', mtinformation, [MbOK],0);
end;

procedure TForm1.Edit_CountKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      BtnFixerClick(Sender);
      key := #0;
    end;
end;

procedure TForm1.Edit_ValueKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
    begin
      BtnAjouterClick(Sender);
      key := #0;
    end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  if OD.Execute then
    Lecture_Matrice(od.FileName,MatRes);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  if SD.Execute then
    Ecriture_Matrice(SD.FileName, MatRes);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  Effacer_Matrice (MatRes);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Algo_Gra_Inverse(Matrice, MatRes);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Algo_Gra_Comp(Matrice, MatRes);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Algo_Mat_Inverse(Matrice, MatRes);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Algo_Mat_Comp(Matrice, MatRes);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Lab_Nbr_Cir.Caption := IntToStr(Nbr_Cir(Matrice,StrToInt(Edit_Long.Text)));
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Prod_Mat(Matrice,Matrice, MatRes);
end;

end.

