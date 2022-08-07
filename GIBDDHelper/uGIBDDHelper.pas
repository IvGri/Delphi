unit uGIBDDHelper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ExtDlgs, Mask, ComCtrls;

type
  TfrmGIBDDHelper = class(TForm)
    btnLoadPhoto: TButton;
    OPD: TOpenPictureDialog;
    imPhoto: TImage;
    lbDateTime: TLabel;
    lbGN: TLabel;
    meGN1: TMaskEdit;
    lbGN2: TLabel;
    meGN2: TMaskEdit;
    lbGN3: TLabel;
    meGN3: TMaskEdit;
    lbPlace: TLabel;
    cbPlace: TComboBox;
    chbMultiplePhotos: TCheckBox;
    chbIncludeEditedPhoto: TCheckBox;
    btnGenerateReport: TButton;
    mmReport: TMemo;
    pnControls: TPanel;
    edDate: TEdit;
    lbGN1: TLabel;
    edTime: TEdit;
    procedure btnLoadPhotoClick(Sender: TObject);
    procedure btnGenerateReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGIBDDHelper: TfrmGIBDDHelper;

implementation

{$R *.dfm}

procedure TfrmGIBDDHelper.btnLoadPhotoClick(Sender: TObject);
var
  AFileName: string;
  ALength: integer;
begin
  if OPD.Execute and (OPD.FileName <> '') then
  begin
//    imPhoto.Picture.LoadFromFile(OPD.FileName);
//    imPhoto.Picture.Bitmap.LoadFromFile(OPD.FileName);
//    imPhoto.Picture.Graphic.LoadFromFile(OPD.FileName);
    pnControls.Enabled := True;
    AFileName := OPD.FileName;
    ALength := Length(AFileName);
    edDate.Text := AFileName[ALength - 12] + AFileName[ALength - 11] + '.' +
      AFileName[ALength - 14] + AFileName[ALength - 13] + '.' +
      AFileName[ALength - 18] + AFileName[ALength - 17] + AFileName[ALength - 16] + AFileName[ALength - 15];
    edTime.Text := AFileName[ALength - 9] + AFileName[ALength - 8] + ':' +
      AFileName[ALength - 7] + AFileName[ALength - 6];
    meGN1.Text := 'X000XX71';
    meGN2.Text := '';
    meGN3.Text := '';
    cbPlace.ItemIndex := -1;
    chbMultiplePhotos.Checked := False;
    chbIncludeEditedPhoto.Checked := False;
    mmReport.Lines.Clear;
  end;
end;

procedure TfrmGIBDDHelper.btnGenerateReportClick(Sender: TObject);

  procedure ReplaceGN(var AReport: string);
  var
    AGN: string;
  begin
    AGN := 'АМ с гос. № ';
    if meGN1.Text <> '' then
      AGN := AGN + meGN1.Text;
    if meGN2.Text <> '' then
      AGN := AGN + ', ' + meGN2.Text;
    if meGN3.Text <> '' then
      AGN := AGN + ', ' + meGN3.Text;
    AGN := AGN + '.';
    AReport := StringReplace(AReport, '<GN>', AGN, [rfReplaceAll]);
  end;

  procedure ReplaceDateTime(var AReport: string);
  begin
    AReport := StringReplace(AReport, '<DT>', 'Дата - ' + edDate.Text +
      ', время - ' + edTime.Text + '.', [rfReplaceAll]);
  end;

  procedure ReplacePostfix(var AReport: string);
  var
    APF: string;
  begin
    if chbMultiplePhotos.Checked then
      APF := 'Прикладываю оригиналы фото нарушения'
    else
      APF := 'Прикладываю оригинал фото нарушения';
    if chbIncludeEditedPhoto.Checked then
      APF := APF + ' и отредактированный снимок с отмеченной зоной тротуара';
    APF := APF + '.';
    AReport := StringReplace(AReport, '<PF>', APF, [rfReplaceAll]);
  end;

const
  CPlaces: array [0..3] of string = (
    'Парковка на тротуаре (а значит и предшествующее этому движение по тротуару). <GN> <DT> ' +
      'Тротуар у перекрестка ул. Коминтерна и ул. Лейтейзена со стороны дома № 2 по ул. Лейтейзена. <PF>',
    'Парковка в зоне действия знака 3.27 "Остановка запрещена". <GN> <DT> ' +
      'Ул. Лейтейзена, рядом с домом № 22 по ул. Коминтерна. <PF>',
    'Парковка менее чем в пяти метрах от пешеходного перехода. <GN> <DT> ' +
      'Пешеходный переход через ул. Лейтейзена со стороны дома № 2 по ул. Лейтейзена на перекрестке ' +
      'ул. Коминтерна и ул. Лейтейзена. <PF>',
    'Парковка на тротуаре (а значит и предшествующее этому движение по тротуару) ' +
      'и в зоне действия знака 3.27 "Остановка запрещена". <GN> <DT> ' +
      'Тротуар у дома № 21 по ул. Коминтерна. <PF>');
var
  AReport: string;
begin
  mmReport.Lines.Clear;
  if cbPlace.ItemIndex >= 0 then
  begin
    AReport := CPlaces[cbPlace.ItemIndex];
    ReplaceGN(AReport);
    ReplaceDateTime(AReport);
    ReplacePostfix(AReport);
    mmReport.Lines.Add(AReport);
  end;
end;

end.
