unit uNewMeasurerDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Menus, StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxLayoutcxEditAdapters, cxContainer, cxEdit, dxCore,
  cxDateUtils, cxTextEdit, cxDropDownEdit, cxCalendar, dxLayoutContainer, cxMaskEdit, cxSpinEdit, cxClasses,
  dxLayoutControl, dxLayoutControlAdapters, cxButtons, dxForms, dxMessageDialog;

type
  TfmNewMeasurerDialog = class(TdxForm)
    lcMainGroup_Root: TdxLayoutGroup;
    lcMain: TdxLayoutControl;
    seDefaultReading: TcxSpinEdit;
    liseDefaultReading: TdxLayoutItem;
    dePrevCheck: TcxDateEdit;
    deNextCheck: TcxDateEdit;
    teStreet: TcxTextEdit;
    liteStreet: TdxLayoutItem;
    seHouse: TcxSpinEdit;
    liseHouse: TdxLayoutItem;
    seRoom: TcxSpinEdit;
    liseRoom: TdxLayoutItem;
    seSerialNumber: TcxSpinEdit;
    liseSerialNumber: TdxLayoutItem;
    lgLocationInfo: TdxLayoutGroup;
    lgMeasurerInfo: TdxLayoutGroup;
    lidePrevCheck: TdxLayoutItem;
    lideNextCheck: TdxLayoutItem;
    lgCheckInfo: TdxLayoutGroup;
    btnAdd: TcxButton;
    libtnAdd: TdxLayoutItem;
    btnCancel: TcxButton;
    libtnCancel: TdxLayoutItem;
    lgActions: TdxLayoutGroup;
    procedure PrevNextCheckPropertiesEditValueChangedhandler(Sender: TObject);
    procedure PrevNextCheckPropertiesValidateHandler(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure teStreetPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure seSerialNumberPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  protected
    procedure UpdateAddButtonStateBy(ASender: TObject; const AError: Boolean);
  end;

  function AddNewMeasurer: Integer;
  function ReplaceMeasurerAt(const AStreet: string; const AHouse, ARoom, AMeasurer: Integer;
    const APrevMeasurers: string): Integer;

implementation

{$R *.dfm}

uses
  uDataModule;

function AddNewMeasurer: Integer;
var
  AForm: TfmNewMeasurerDialog;
begin
  Result := -1;
  AForm := TfmNewMeasurerDialog.Create(Application.MainForm);
  try
    AForm.seSerialNumber.ValidateEdit;
    AForm.dePrevCheck.ValidateEdit;
    AForm.deNextCheck.ValidateEdit;
    AForm.teStreet.ValidateEdit;

    if AForm.ShowModal = mrOk then
    begin
      dmMain.ADOqAddNewMeasurer.Parameters.ParamValues['pSerialNumber'] := AForm.seSerialNumber.Value;
      dmMain.ADOqAddNewMeasurer.Parameters.ParamValues['pReading'] := AForm.seDefaultReading.Value;
      dmMain.ADOqAddNewCheck.Parameters.ParamValues['pMeasurer'] := AForm.seSerialNumber.Value;
      dmMain.ADOqAddNewCheck.Parameters.ParamValues['pPrevCheck'] := AForm.dePrevCheck.Date;
      dmMain.ADOqAddNewCheck.Parameters.ParamValues['pNextCheck'] := AForm.deNextCheck.Date;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pMeasurer'] := AForm.seSerialNumber.Value;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pStreet'] := AForm.teStreet.Text;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pHouse'] := AForm.seHouse.Value;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pRoom'] := AForm.seRoom.Value;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pPrevMeasurers'] := '';
      try
        Result := dmMain.ADOqAddNewCheck.ExecSQL + dmMain.ADOqAddNewLocation.ExecSQL + dmMain.ADOqAddNewMeasurer.ExecSQL;
      except
        dxMessageDlg('Attempt to add new measurer has failed', mtError, [mbOK], 0);
      end;
    end;
  finally
    AForm.Free;
  end;
end;

function ReplaceMeasurerAt(const AStreet: string; const AHouse, ARoom, AMeasurer: Integer;
  const APrevMeasurers: string): Integer;
var
  AForm: TfmNewMeasurerDialog;
begin
  Result := -1;
  AForm := TfmNewMeasurerDialog.Create(Application.MainForm);
  try
    AForm.seSerialNumber.ValidateEdit;
    AForm.dePrevCheck.ValidateEdit;
    AForm.deNextCheck.ValidateEdit;

    AForm.teStreet.Text := AStreet;
    AForm.seHouse.Value := AHouse;
    AForm.seRoom.Value := ARoom;
    AForm.lgLocationInfo.Enabled := False;

    AForm.btnAdd.Width := AForm.btnAdd.Width + 30;
    AForm.btnAdd.Caption := 'Replace Measurer';

    if AForm.ShowModal = mrOk then
    begin
      dmMain.ADOqDeleteFromMeasurers.Parameters.ParamValues['pSerialNumber'] := AMeasurer;
      dmMain.ADOqDeleteFromChecks.Parameters.ParamValues['pMeasurer'] := AMeasurer;
      dmMain.ADOqDeleteFromLocations.Parameters.ParamValues['pMeasurer'] := AMeasurer;
      dmMain.ADOqAddNewMeasurer.Parameters.ParamValues['pSerialNumber'] := AForm.seSerialNumber.Value;
      dmMain.ADOqAddNewMeasurer.Parameters.ParamValues['pReading'] := AForm.seDefaultReading.Value;
      dmMain.ADOqAddNewCheck.Parameters.ParamValues['pMeasurer'] := AForm.seSerialNumber.Value;
      dmMain.ADOqAddNewCheck.Parameters.ParamValues['pPrevCheck'] := AForm.dePrevCheck.Date;
      dmMain.ADOqAddNewCheck.Parameters.ParamValues['pNextCheck'] := AForm.deNextCheck.Date;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pMeasurer'] := AForm.seSerialNumber.Value;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pStreet'] := AStreet;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pHouse'] := AHouse;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pRoom'] := ARoom;
      dmMain.ADOqAddNewLocation.Parameters.ParamValues['pPrevMeasurers'] := APrevMeasurers + IntToStr(AMeasurer) + ';';
      try
        Result := dmMain.ADOqDeleteFromMeasurers.ExecSQL + dmMain.ADOqDeleteFromChecks.ExecSQL +
          dmMain.ADOqDeleteFromLocations.ExecSQL + dmMain.ADOqAddNewCheck.ExecSQL + dmMain.ADOqAddNewLocation.ExecSQL +
          dmMain.ADOqAddNewMeasurer.ExecSQL;
      except
        dxMessageDlg('Attempt to replace old measurer has failed', mtError, [mbOK], 0);
      end;
    end;
  finally
    AForm.Free;
  end;
end;

{ TfmNewMeasurerDialog }

procedure TfmNewMeasurerDialog.UpdateAddButtonStateBy(ASender: TObject; const AError: Boolean);
begin
  if AError then
    TControl(ASender).Tag := 1
  else
    TControl(ASender).Tag := 0;
  btnAdd.Enabled := (seSerialNumber.Tag + dePrevCheck.Tag + deNextCheck.Tag + teStreet.Tag) = 0;
end;

procedure TfmNewMeasurerDialog.PrevNextCheckPropertiesEditValueChangedhandler(Sender: TObject);
begin
  if Sender = dePrevCheck then
    deNextCheck.ValidateEdit
  else
    dePrevCheck.ValidateEdit;
end;

procedure TfmNewMeasurerDialog.PrevNextCheckPropertiesValidateHandler(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DisplayValue = '';
  if Error then
    ErrorText := 'Check date must be defined'
  else
  begin
    if Sender = dePrevCheck then
      Error := StrToDate(VarToStr(DisplayValue)) >= deNextCheck.Date
    else
      Error := StrToDate(VarToStr(DisplayValue)) <= dePrevCheck.Date;
    if Error then
      ErrorText := 'Date of the next check must be after the date of prev check';
  end;
  UpdateAddButtonStateBy(Sender, Error);
end;

procedure TfmNewMeasurerDialog.teStreetPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  Error := VarToStr(DisplayValue) = '';
  if Error then
    ErrorText := 'Street must be defined';
  UpdateAddButtonStateBy(Sender, Error);
end;

procedure TfmNewMeasurerDialog.seSerialNumberPropertiesValidate(Sender: TObject; var DisplayValue: Variant;
  var ErrorText: TCaption; var Error: Boolean);
begin
  Error := False;
  dmMain.ADOqFindSerialNumber.Parameters.ParamValues['pSerialNumber'] := DisplayValue;
  try
    dmMain.ADOqFindSerialNumber.Open;
    Error := dmMain.ADOqFindSerialNumber.RecordCount > 0;
    if Error then
      ErrorText := 'Measurer with specified serial number already exists';
  finally
    dmMain.ADOqFindSerialNumber.Close;
  end;
  UpdateAddButtonStateBy(Sender, Error);
end;

end.
