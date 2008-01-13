unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ActnList, ImgList, ToolWin, Menus,
  StdCtrls, StrUtils, CommCtrl, Math, NetApi,
  VirtualTrees,
  JwaWindows,
  JwsclTerminalServer;
//  VirtualTrees;// Contnrs, RpcWinsta, JwsclEncryption, JwsclTypes,
//  JwsclEnumerations, Internal;

type
  PServerNodeData = ^TServerNodeData;
  TServerNodeData = record
    Index: Integer;
    Caption: String;
    PTerminalServerList: PJwTerminalServerList;
  end;

  PUserNodeData = ^TUserNodeData;
  TUserNodeData = record
    Index: Integer;
    List: PJwWTSSessionList;
  end;

  PSessionNodeData = PUserNodeData;
  TSessionNodeData = TUserNodeData;

  PProcessNodeData = ^TProcessNodeData;
  TProcessNodeData = record
    Index: Integer;
    List: PJwWTSProcessList;
  end;

// Class below is used to store imageindex of icons in the Imagelist
TIconIndex = (icThisComputer, icWorld, icServers, icServersSel, icServer,
  icServerSel, icUserGhosted, icUser, IcNetworkUser, icNetwork, icComputer,
  icProcess, icChip, icMemory, icListener, icVirtual, icCPUTime, icClock,
  icService, icNetworkService, icSystem);

type
  TMainForm = class(TForm)
    VSTUser: TVirtualStringTree;
    VSTSession: TVirtualStringTree;
    VSTServer: TVirtualStringTree;
    VSTProcess: TVirtualStringTree;
    MainMenu1: TMainMenu;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    actConnect: TAction;
    actDisconnect: TAction;
    actSendMessage: TAction;
    actRemoteControl: TAction;
    actReset: TAction;
    actStatus: TAction;
    ActLogoff: TAction;
    ActEndProcess: TAction;
    actRefresh: TAction;
    Actions1: TMenuItem;
    View1: TMenuItem;
    ools1: TMenuItem;
    Help1: TMenuItem;
    Connect1: TMenuItem;
    Disconnect1: TMenuItem;
    SendMessage1: TMenuItem;
    RemoteControl1: TMenuItem;
    Reset1: TMenuItem;
    Reset2: TMenuItem;
    N1: TMenuItem;
    Logoff1: TMenuItem;
    N2: TMenuItem;
    EndProcess1: TMenuItem;
    Disconnectfromallserversindomain1: TMenuItem;
    N3: TMenuItem;
    Connecttocomputer1: TMenuItem;
    RefreshServerinAllDomains1: TMenuItem;
    DisconnectfromAllServers1: TMenuItem;
    Emptyfavorites1: TMenuItem;
    N4: TMenuItem;
    Exit1: TMenuItem;
    ToolButton14: TToolButton;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    StateImagesList: TImageList;
    ImageList2: TImageList;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VSTUserGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VSTUserGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VSTUserGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure VSTUserCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure VSTServerGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure VSTServerGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
//    procedure VSTServerColumnDblClick(Sender: TBaseVirtualTree;
//      Column: TColumnIndex; Shift: TShiftState);
    procedure VSTServerFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure Button1Click(Sender: TObject);
    procedure VSTServerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VSTSessionGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure VSTSessionGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure VSTProcessGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure VSTProcessGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure VSTHeaderClick(Sender: TVTHeader;
      Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure VSTSessionCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure VSTProcessCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure VSTServerGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VSTServerChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTProcessGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VSTServerCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
//    procedure VSTServerDblClick(Sender: TObject);
  private
    { Private declarations }
    TerminalServers: TJwTerminalServerList;
    pThisComputerNode: PVirtualNode;
    pAllListedServersNode: PVirtualNode;
    procedure UpdateVirtualTree(const AVirtualTree: TBaseVirtualTree;
      const PSessionList: PJwWTSSessionList; PrevCount: Integer);
    procedure UpdateProcessVirtualTree(const AVirtualTree: TBaseVirtualTree;
      const PProcessList: PJwWTSProcessList; PrevCount: Integer);
    procedure OnTerminalServerEvent(Sender: TObject);
    procedure OnEnumerateServersDone(Sender: TObject);
  public
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  IconRec: TIconRec;
implementation

{function I_RpcBindingIsClientLocal(BindingHandle: RPC_BINDING_HANDLE;
  out ClientLocalFlag: Integer): RPC_STATUS; external 'rpcrt4.dll';}

procedure NTCheck(Res: Cardinal);
begin
  If (Res <>0) then
    ShowMessage(SysErrorMessage(RtlNtStatusToDosError(Res)));
end;
{$R *.dfm}
procedure TMainForm.UpdateVirtualTree(const AVirtualTree: TBaseVirtualTree;
  const PSessionList: PJwWTSSessionList; PrevCount: Integer);
var i: Integer;
  pNode: PVirtualNode;
  pPrevNode: PVirtualNode;
  pData: PUserNodeData;
  NewCount: Integer;
begin
  // Get the last node
  pNode := AVirtualTree.GetLast;

  // Now iterate from last to first node
  repeat
    pData := AVirtualTree.GetNodeData(pNode);
    // Get the previous node and store the pointer, because in the next step
    // we might delete the current node ;-)
    pPrevNode := AVirtualTree.GetPrevious(pNode);

    // Is the node data pointing to PSessionList and do we need to delete it?
    if (pData^.List = PSessionList) and
      (pData^.Index > PSessionList^.Count-1) then
    begin
      // Delete the node (we have no Session Data for it)
      AVirtualTree.DeleteNode(pNode);
    end
    else begin
      // Invalidating the node will trigger the GetText event which will update
      // our data
      AVirtualTree.InvalidateNode(pNode);
    end;
    pNode := pPrevNode;
  until pNode = nil;

  // How many new sessions are there?
  NewCount := PSessionList^.Count - PrevCount;

  // Create a new node for each new session
  for i := 0 to NewCount-1 do
  begin
    pNode := AVirtualTree.AddChild(nil);
    pData := AVirtualTree.GetNodeData(pNode);
    pData^.Index := PrevCount;
    pData^.List := PSessionList;
  end;
end;

procedure TMainForm.UpdateProcessVirtualTree(const AVirtualTree: TBaseVirtualTree; const PProcessList: PJwWTSProcessList; PrevCount: Integer);
var i: Integer;
  pNode: PVirtualNode;
  pPrevNode: PVirtualNode;
  pData: PProcessNodeData;
  NewCount: Integer;
begin
  // Get the last node
  pNode := AVirtualTree.GetLast;

  // Now iterate from last to first node
  repeat
    pData := AVirtualTree.GetNodeData(pNode);
    // Get the previous node and store the pointer, because in the next step
    // we might delete the current node ;-)
    pPrevNode := AVirtualTree.GetPrevious(pNode);

    // Is the node data pointing to PSessionList and do we need to delete it?
    if (pData^.List = PProcessList) and
      (pData^.Index > PProcessList^.Count-1) then
    begin
      // Delete the node (we have no Session Data for it)
      AVirtualTree.DeleteNode(pNode);
    end
    else begin
      // Invalidating the node will trigger the GetText event which will update
      // our data
      AVirtualTree.InvalidateNode(pNode);
    end;
    pNode := pPrevNode;
  until pNode = nil;

  // How many new sessions are there?
  NewCount := PProcessList^.Count - PrevCount;

  // Create a new node for each new session
  for i := 0 to NewCount-1 do
  begin
    pNode := AVirtualTree.AddChild(nil);
    pData := AVirtualTree.GetNodeData(pNode);
    pData^.Index := PrevCount;
    pData^.List := PProcessList;
  end;
end;

procedure TMainForm.OnTerminalServerEvent(Sender: TObject);
var PrevCount: Integer;
begin
  with (Sender as TJwTerminalServer) do
  begin
    // Get the previous session count
    PrevCount := Sessions.Count;

    // Enumerate sessions
    EnumerateSessions;

    // Sychronize User and Session tree's with the SessionList
    UpdateVirtualTree(VSTUser, @Sessions, PrevCount);
    UpdateVirtualTree(VSTSession, @Sessions, PrevCount);
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var i: Integer;
  PrevCount: Integer;
begin
  (Sender as TTimer).Enabled := False;
  for i := 0 to TerminalServers.Count - 1 do
  begin
    PrevCount := TerminalServers[i].Processes.Count;
    TerminalServers[i].EnumerateProcesses;
    UpdateProcessVirtualTree(VSTProcess, @TerminalServers[i].Processes,
      PrevCount);
  (Sender as TTimer).Enabled := True;
  end;
end;

procedure TMainForm.OnEnumerateServersDone(Sender: TObject);
var i: Integer;
  pNode: PVirtualNode;
  pData: PServerNodeData;
begin
  with Sender as TJwTerminalServer do
  begin
    for i := 0 to ServerList.Count-1 do
    begin
      pNode := VSTServer.AddChild(pAllListedServersNode);
      pData := VSTServer.GetNodeData(pNode);
      pData^.Index := -1;
      pData^.Caption := ServerList.Strings[i];
      pData^.PTerminalServerList := nil;
      // Assign a checkbox
      pNode^.CheckType := ctCheckBox;
    end;
  end;

  VSTServer.FullExpand(pAllListedServersNode);
end;

procedure TMainForm.Button1Click(Sender: TObject);
{  SystemName: LSA_UNICODE_STRING;
  ObjectAttributes: _LSA_OBJECT_ATTRIBUTES;
  PolicyHandle: LSA_HANDLE;
  EnumerationContext: Cardinal;
  Buffer: array[0..ANYSIZE_ARRAY-1] of PLSA_TRUST_INFORMATION;
  CountReturned: Cardinal;
  Count: Integer;
  i: Integer;
  Res: NTSTATUS;
  bufptr: Pointer;}
var
  DomainControllerInfo: PDOMAIN_CONTROLLER_INFOW;
  DomainNames: PWideChar;
  Current: PWideChar;
  pData: PServerNodeData;
begin
  if DsGetDcNameW(nil, nil, nil, nil, DS_BACKGROUND_ONLY or DS_RETURN_FLAT_NAME,
    DomainControllerInfo) = ERROR_SUCCESS then
  begin
    NetEnumerateTrustedDomains(DomainControllerInfo^.DomainControllerName, DomainNames);
    Current := DomainNames;
    while Current[0] <> #0 do
    begin
      pData := VSTServer.GetNodeData(VSTServer.AddChild(pAllListedServersNode));
      pData^.Caption := Current;
      Current := Current + Length(Current) + 1;
    end;
    pData := VSTServer.GetNodeData(VSTServer.AddChild(pAllListedServersNode));
    pData^.Caption := DomainControllerInfo.DomainName;
    VSTServer.Sort(pAllListedServersNode, 0, sdAscending);
    VSTServer.FullExpand(pAllListedServersNode);

    NetApiBufferFree(DomainNames);
  end;
end;
{  bufptr := nil;
  if NetGetAnyDCName(nil, nil, PByte(bufptr)) <> NERR_Success then
  begin
    Exit;
  end;

  ZeroMemory(@ObjectAttributes, Sizeof(ObjectAttributes));

  if LsaOpenPolicy(bufptr, ObjectAttributes, POLICY_VIEW_LOCAL_INFORMATION,
    PolicyHandle) = STATUS_SUCCESS then
  begin
    count := 0;
    Res := STATUS_MORE_ENTRIES;

    while Res = STATUS_MORE_ENTRIES do
    begin
      Res := LsaEnumerateTrustedDomains(PolicyHandle, EnumerationContext, @Buffer,
        2048, CountReturned);
      Inc(Count, CountReturned);

      if Res = STATUS_SUCCESS then Break;
    end;

    ShowMessageFmt('Error: %s', [SysErrorMessage(LsaNtStatusToWinError(Res))]);

    for i := 0 to Count - 1 do
    begin
      ShowMessageFmt('Name: "%s"', [Buffer[i].Name.Buffer]);
    end;

    NetApiBufferFree(bufptr);
    LsaClose(PolicyHandle);
  end;
end;}


procedure TMainForm.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TMainForm.Button3Click(Sender: TObject);
var DomainList: TStringList;
  i: Integer;
  pData: PServerNodeData;
begin
// p := EnumerateMultiUserServers('EUROPE');
//  DomainList := PWArrayToStringList(p);
//  LocalFree(Cardinal(p));
  DomainList := EnumerateDomains;

  for i := 0 to DomainList.Count - 1 do
  begin
    pData := VSTServer.GetNodeData(VSTServer.AddChild(pAllListedServersNode));
    pData^.Index := -2;
    pData^.Caption := DomainList[i];
    pData^.PTerminalServerList := nil;
  end;

  VSTServer.FullExpand(pAllListedServersNode);
  DomainList.Free;
end;

procedure AutoSizeVST(const AVirtualTree: TVirtualStringTree);
var i: Integer;
begin
  for i := 0 to AVirtualTree.Header.Columns.Count-1 do
  begin
    AVirtualTree.Header.Columns[i].Width :=
      Max(AVirtualTree.Header.Columns[i].Width, AVirtualTree.GetMaxColumnWidth(i));
  end;
    
end;

procedure TMainForm.FormCreate(Sender: TObject);
var pNode: PVirtualNode;
  pData: PServerNodeData;
begin
{$IFDEF FASTMM}
  ReportMemoryLeaksOnShutDown := DebugHook <> 0;
{$ENDIF FASTMM}
  TerminalServers := TJwTerminalServerList.Create;
  TerminalServers.Owner := Self;

  // Create the 'This Computer' parent node
  pThisComputerNode := VSTServer.AddChild(nil);
  pData := VSTServer.GetNodeData(pThisComputerNode);

  // This is a node without a Terminal Server instance attached so we set
  // Index to -2 (never add a Terminal Server instance to it) and Pointer to nil
  pData^.Caption := 'This Computer';
  pData^.Index := -2;
  pData^.PTerminalServerList := nil;

  // Add a child node (local computer)
  pNode := VSTServer.AddChild(pThisComputerNode);

//  VSTServer.CheckState[pThisComputerNode] := csCheckedNormal;
//  pData := VSTServer.GetNodeData(pNode);

  // This node can be checked
  pNode^.CheckType := ctCheckBox;
  // The this computer node is checked by default
  pNode^.CheckState := csCheckedNormal;

  // Trigger the OnChecked Event, this will fill the listviews for this computer
  VSTServer.OnChecked(VSTServer, pNode);

  // Expand the This Computer Node
  VSTServer.FullExpand(pThisComputerNode);

  // Create the 'All Listed Servers' parent node
  pAllListedServersNode := VSTServer.AddChild(nil);
  pData := VSTServer.GetNodeData(pAllListedServersNode);

  // This is a node without a Terminal Server instance attached so we set
  // Index to -2 (never add a Terminal Server instance to it) and Pointer to nil
  pData^.Caption := 'All Listed Servers';
  pData^.Index := -2;
  pData^.PTerminalServerList := nil;
  AutoSizeVST(VSTUser);
  AutoSizeVST(VSTSession);
  AutoSizeVST(VSTProcess);
end;

procedure TMainForm.VSTUserGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  pData: PUserNodeData;
  CurrentItem : TJwWTSSession;
begin
  pData := Sender.GetNodeData(Node);

  // Do we have data for this session?
  if pData^.List^.Count > pData^.Index then
  begin
    CurrentItem := pData^.List^.Items[pData^.Index];
    if CurrentItem.Username <> '' then
    begin
      // show the node!
      if not (vsVisible in Node.States) then
      begin
        Sender.IsVisible[Node] := True;
      end;

      case Column of
        0: CellText := CurrentItem.Owner.Owner.Server;
        1: CellText := CurrentItem.Username;
        2: CellText := CurrentItem.WinStationName;
        3: CellText := IntToStr(CurrentItem.SessionId);
        4: CellText := Format('%s %d %d', [CurrentItem.ConnectStateStr,
          (Ord(CurrentItem.ShadowInformation.ShadowMode)), (Ord(CurrentItem.ShadowInformation.ShadowState))]);
        5: CellText := CurrentItem.IdleTimeStr;
        6: CellText := CurrentItem.LogonTimeStr;
      end;
    end
    else begin
      // Users Listview only shows sessions that have a user attached!
      Sender.IsVisible[Node] := False;
    end;
  end;
end;

procedure TMainForm.VSTHeaderClick(Sender: TVTHeader;
  Column: TColumnIndex; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var LastSortColumn: Integer;
begin
  with Sender do
  begin
    LastSortColumn := SortColumn;
    SortColumn := Column;
    if Column = LastSortColumn then
    begin
      if SortDirection = sdAscending then
      begin
        SortDirection := sdDescending;
      end
      else begin
        SortDirection := sdAscending;
      end;
    end;
    // Sort
    Treeview.SortTree(Column, SortDirection);
  end;
end;

procedure TMainForm.VSTUserGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var
  pData: PUserNodeData;
  Username: string;
  ConnectState: TWtsConnectStateClass;
  IsConsole: Boolean;
begin
  pData := Sender.GetNodeData(Node);

  // Do we have data for this session?
  if pData^.List^.Count > pData^.Index then
  begin
    Username := pData^.List^.Items[pData^.Index].Username;
    ConnectState := pData^.List^.Items[pData^.Index].ConnectState;
    IsConsole := pData^.List^.Items[pData^.Index].WdFlag < WD_FLAG_RDP;

    if Kind in [ikNormal, ikSelected] then begin
      case column of
        0: ImageIndex := Integer(icServer);
        1: begin
          if Username = '' then
          begin
            ImageIndex := -1; // No Icon!
          end
          else if username = 'SYSTEM' then
          begin
            ImageIndex := Integer(icSystem);
          end
          else if username = 'LOCAL SERVICE' then
          begin
            ImageIndex := Integer(icService);
          end
          else if username = 'NETWORK SERVICE' then
          begin
            ImageIndex := Integer(icNetworkService);
          end
          else if ConnectState = WTSActive then
          begin
            ImageIndex := Integer(icUser);
          end
          else begin
            ImageIndex := Integer(icUserGhosted);
          end;
        end;
        2: begin
          if IsConsole then
          begin
            ImageIndex := Integer(icComputer);
          end
          else if ConnectState = WTSListen then
          begin
            ImageIndex := Integer(icListener);
          end
          else if username <> '' then begin
            ImageIndex := Integer(icNetworkUser);
          end
          else begin
            ImageIndex := Integer(icNetwork);
          end;
        end;
      end;
    end;
  end;
end;

procedure TMainForm.VSTServerGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
begin
  case Kind of
    ikNormal, ikSelected:
    begin
//      if Node^.ChildCount > 0 then
      if Node^.Parent = Sender.RootNode  then
      begin
        // If it is a rootnode then the index in the tree eq imageindex
        ImageIndex := Node^.Index;
      end
      else if Node^.Parent = pAllListedServersNode then
      begin
        ImageIndex := Integer(icServers);
      end
      else begin
        ImageIndex := Integer(icServer);
      end;
    end;
    ikState:
    begin
      if Sender.CheckState[Node] = csCheckedNormal then
      begin
        ImageIndex := 4;
      end
      else begin
        ImageIndex := 1;
      end;
    end;
  end;
end;

procedure TMainForm.VSTServerGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TServerNodeData);
end;

procedure TMainForm.VSTUserGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TUserNodeData);
end;

procedure TMainForm.VSTUserCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var Data1: PUserNodeData;
  Data2: PUserNodeData;
  Index1: Integer;
  Index2: Integer;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);

  if (not Assigned(Data1)) or (not Assigned(Data2)) then
  begin
    Result := 0;
  end
  else begin
    Index1 := Data1^.Index;
    Index2 := Data2^.Index;

    // Do we have data of these sessions?
    if (Data1^.List^.Count > Index1) and (Data2^.List^.Count > Index2) then
    begin
      case Column of
        0: begin
          Result := CompareText(Data1^.List^.Items[Index1].Owner.Owner.Server,
            Data2^.List^.Items[Index2].Owner.Owner.Server);
        end;
        1: begin
          Result := CompareText(Data1^.List^.Items[Index1].Username,
            Data2^.List^.Items[Index2].Username);
        end;
        2: begin
          Result := CompareText(Data1^.List^.Items[Index1].WinStationName,
            Data2^.List^.Items[Index2].WinStationName);
        end;
        3: begin
          if Data1^.List^.Items[Index1].SessionId >
            Data2^.List^.Items[Index2].SessionId then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].SessionId =
            Data2^.List^.Items[Index2].SessionId then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        4: begin
          Result := CompareText(Data1^.List^.Items[Index1].ConnectStateStr,
            Data2^.List^.Items[Index2].ConnectStateStr);
        end;
        5: begin
          if Data1^.List^.Items[Index1].IdleTime >
            Data2^.List^.Items[Index2].IdleTime then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].IdleTime =
            Data2^.List^.Items[Index2].IdleTime then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        6: begin
          if Data1^.List^.Items[Index1].LogonTime >
            Data2^.List^.Items[Index2].LogonTime then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].LogonTime =
            Data2^.List^.Items[Index2].LogonTime then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
      end;
    end
    else begin
      // We have no data, so return equal, should not occur!
      Result := 0;
    end;
  end;
end;

procedure TMainForm.VSTServerGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var pData: PServerNodeData;
begin
  pData := Sender.GetNodeData(Node);
  if pData^.PTerminalServerList <> nil then
  begin
    CellText := pData^.PTerminalServerList^[pData^.Index].Server;
  end
  else begin
    CellText := pData^.Caption;
  end;
end;

procedure TMainForm.VSTServerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var pServerData: PServerNodeData;
  pUserNode: PVirtualNode;
  pUserData: PUserNodeData;
  pSessionNode: PVirtualNode;
  pSessionData: PSessionNodeData;
  i: Integer;
  pProcessNode: PVirtualNode;
  pProcessData: PProcessNodeData;
begin
  with Sender as TVirtualStringTree do
  begin
    ShowMessageFmt('Index=%d', [GetNodeAt(X,Y)^.Index]);
    pServerData := GetNodeData(GetNodeAt(X, Y));
    // Is this a server node?
    if pServerData^.Index > -2 then
    begin
      // Is a Terminal Server instance assigned?
      if pServerData^.PTerminalServerList = nil then
      begin
        if TerminalServers.FindByServer(pServerData^.Caption) <> nil then
        begin

          // Create a Terminal Server instance
          pServerData^.Index := TerminalServers.Add(TjwTerminalServer.Create);
          // Set the servername
          TerminalServers[pServerData^.Index].Server := pServerData^.Caption;
          // Point the node data to a Terminal Server instance
          pServerData^.PTerminalServerList := @TerminalServers;
        end;

        with pServerData^.PTerminalServerList^[pServerData^.Index] do
        begin
          // EnumerateSessions
          if EnumerateSessions then
          begin
            for i := 0 to Sessions.Count - 1 do
            begin
              // Create a node for the session in the Users VST
              pUserNode := VSTUser.AddChild(nil);
              // and add the data
                pUserData := VSTUser.GetNodeData(pUserNode);
              // Set the Index
              pUserData^.Index := i;
              // Point to TerminalServerList.TerminalServer[Index].SessionList
              pUserData^.List := @Sessions;

              // Create a node for the session in the Sessions VST
              pSessionNode := VSTSession.AddChild(nil);
              // and add the data
              pSessionData := VSTSession.GetNodeData(pSessionNode);
              // Set the Index
              pSessionData^.Index := i;
              // Point to TerminalServerList.TerminalServer[Index].SessionList
              pSessionData^.List := @Sessions;
            end;
          end;

          // Assign Session Event Handler
          OnSessionEvent := OnTerminalServerEvent;
          if EnumerateProcesses then
          begin
            for i := 0 to Processes.Count - 1 do
            begin
              // Create a node for the session
              pProcessNode := VSTProcess.AddChild(nil);
              // and add the data
              pProcessData := VSTProcess.GetNodeData(pProcessNode);
              // Set the Index
              pProcessData^.Index := i;
                // Point to TerminalServerList.TerminalServer[Index].SessionList
              pProcessData^.List := @Processes;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMainForm.VSTSessionCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var Data1: PSessionNodeData;
  Data2: PSessionNodeData;
  Index1: Integer;
  Index2: Integer;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);

  if (not Assigned(Data1)) or (not Assigned(Data2)) then
  begin
    Result := 0;
  end
  else begin
    Index1 := Data1^.Index;
    Index2 := Data2^.Index;

    // Do we have data of these sessions?
    if (Data1^.List^.Count > Index1) and (Data2^.List^.Count > Index2) then
    begin
      case Column of
        0: begin
          Result := CompareText(Data1^.List^.Items[Index1].Owner.Owner.Server,
            Data2^.List^.Items[Index2].Owner.Owner.Server);
        end;
        1: begin
          Result := CompareText(Data1^.List^.Items[Index1].Username,
            Data2^.List^.Items[Index2].Username);
        end;
        2: begin
          if Data1^.List^.Items[Index1].SessionId >
            Data2^.List^.Items[Index2].SessionId then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].SessionId =
            Data2^.List^.Items[Index2].SessionId then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        3: begin
          Result := CompareText(Data1^.List^.Items[Index1].ConnectStateStr,
            Data2^.List^.Items[Index2].ConnectStateStr);
        end;
        4: begin
          Result := CompareText(Data1^.List^.Items[Index1].WinStationDriverName,
            Data2^.List^.Items[Index2].WinStationDriverName);
        end;
        5: begin
          Result := CompareText(Data1^.List^.Items[Index1].ClientName,
            Data2^.List^.Items[Index2].ClientName);
        end;
        6: begin
          if Data1^.List^.Items[Index1].IdleTime >
            Data2^.List^.Items[Index2].IdleTime then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].IdleTime =
            Data2^.List^.Items[Index2].IdleTime then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        7: begin
          if Data1^.List^.Items[Index1].LogonTime >
            Data2^.List^.Items[Index2].LogonTime then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].LogonTime =
            Data2^.List^.Items[Index2].LogonTime then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        8: begin
          Result := CompareText(Data1^.List^.Items[Index1].RemoteAddress,
            Data2^.List^.Items[Index2].RemoteAddress);
        end;
        9: begin
          Result := CompareText(Data1^.List^.Items[Index1].RemoteAddress,
            Data2^.List^.Items[Index2].RemoteAddress);
        end;
        10: begin
          if Data1^.List^.Items[Index1].IncomingBytes >
            Data2^.List^.Items[Index2].IncomingBytes then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].IncomingBytes =
            Data2^.List^.Items[Index2].IncomingBytes then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        11: begin
          if Data1^.List^.Items[Index1].OutgoingBytes >
            Data2^.List^.Items[Index2].OutgoingBytes then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].OutgoingBytes =
            Data2^.List^.Items[Index2].OutgoingBytes then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        12: begin
          Result := CompareText(Data1^.List^.Items[Index1].CompressionRatio,
            Data2^.List^.Items[Index2].CompressionRatio);
        end;
      end;
    end
    else begin
      // We have no data, so return equal, should not occur!
      Result := 0;
    end;
  end;
end;

procedure TMainForm.VSTSessionGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TSessionNodeData);
end;

procedure TMainForm.VSTSessionGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var pData: PSessionNodeData;
begin
  pData := Sender.GetNodeData(Node);

  // Do we have data for this session?
  if pData^.List^.Count > pData^.Index then
  begin
    case Column of
      0: CellText := pData^.List^.Items[pData^.Index].Owner.Owner.Server;
      1: CellText := pData^.List^.Items[pData^.Index].Username;
      2: CellText := IntToStr(pData^.List^.Items[pData^.Index].SessionId);
      3: CellText := pData^.List^.Items[pData^.Index].ConnectStateStr;
      4: CellText := pData^.List^.Items[pData^.Index].WinStationDriverName;
      5: CellText := pData^.List^.Items[pData^.Index].ClientName;
      6: CellText := pData^.List^.Items[pData^.Index].IdleTimeStr;
      7: CellText := pData^.List^.Items[pData^.Index].LogonTimeStr;
      8: CellText := pData^.List^.Items[pData^.Index].RemoteAddress;
    end;
    // Show Session Counters only for Active and non-console sessions:
    if (pData^.List^.Items[pData^.Index].ConnectState = WTSActive) and
      (pData^.List^.Items[pData^.Index].WdFlag > WD_FLAG_CONSOLE) then
    begin
      case Column of
        9: CellText := IntToStr(pData^.List^.Items[pData^.Index].IncomingBytes);
        10: CellText := IntToStr(pData^.List^.Items[pData^.Index].OutgoingBytes);
        11: CellText := pData^.List^.Items[pData^.Index].CompressionRatio;
      end;
    end
    // Set empty value for In- and OutgoingBytes and CompressionRatio
    else if Column > 8 then
    begin
      CellText := '';
    end;
  end;
end;

{procedure TMainForm.VSTServerColumnDblClick(Sender: TBaseVirtualTree;
  Column: TColumnIndex; Shift: TShiftState);
var pServerData: PServerNodeData;
  pUserNode: PVirtualNode;
  pUserData: PUserNodeData;
  pSessionNode: PVirtualNode;
  pSessionData: PSessionNodeData;
  i: Integer;
begin
  pServerData := Sender.GetNodeData(Sender.FocusedNode);
  // Is this a server node?
  if pServerData^.Index > -2 then
  begin
    // Is a Terminal Server instance assigned?
    if pServerData^.PTerminalServerList = nil then
    begin
      // Create a Terminal Server instance
      pServerData^.Index := TerminalServers.Add(TjwTerminalServer.Create);
      // Set the servername
      TerminalServers[pServerData^.Index].Server := pServerData^.Caption;
      // Point the node data to a Terminal Server instance
      pServerData^.PTerminalServerList := @TerminalServers;
    end;

    with pServerData^.PTerminalServerList^[pServerData^.Index] do
    begin
      // EnumerateSessions
      if EnumerateSessions then
      begin
        for i := 0 to Sessions.Count - 1 do
        begin
          // Create a node for the session
          pUserNode := VSTUser.AddChild(nil);
          // and add the data
          pUserData := VSTUser.GetNodeData(pUserNode);
          // Set the Index
          pUserData^.Index := i;
          // Point to TerminalServerList.TerminalServer[Index].SessionList
          pUserData^.List := @Sessions;

          // Create a node for the session in the Sessions VST
          pSessionNode := VSTSession.AddChild(nil);
          // and add the data
          pSessionData := VSTSession.GetNodeData(pSessionNode);
          // Set the Index
          pSessionData^.Index := i;
          // Point to TerminalServerList.TerminalServer[Index].SessionList
          pSessionData^.List := @Sessions;
        end;
      end;

      // Assign Event Handler
      OnSessionEvent := OnTerminalServerEvent;
    end;
  end;
end;}

procedure TMainForm.VSTProcessCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var Data1: PProcessNodeData;
  Data2: PProcessNodeData;
  Index1: Integer;
  Index2: Integer;
begin
  Data1 := Sender.GetNodeData(Node1);
  Data2 := Sender.GetNodeData(Node2);

  if (not Assigned(Data1)) or (not Assigned(Data2)) then
  begin
    Result := 0;
  end
  else begin
    Index1 := Data1^.Index;
    Index2 := Data2^.Index;

    // Do we have data of these sessions?
    if (Data1^.List^.Count > Index1) and (Data2^.List^.Count > Index2) then
    begin
      case Column of
        0: begin
          Result := CompareText(Data1^.List^.Items[Index1].Owner.Owner.Server,
            Data2^.List^.Items[Index2].Owner.Owner.Server);
        end;
        1: begin
          Result := CompareText(Data1^.List^.Items[Index1].Username,
            Data2^.List^.Items[Index2].Username);
        end;
        2: begin
          Result := CompareText(Data1^.List^.Items[Index1].WinStationName,
            Data2^.List^.Items[Index2].WinStationName);
        end;
        3: begin
          if Data1^.List^.Items[Index1].SessionId >
            Data2^.List^.Items[Index2].SessionId then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].SessionId =
            Data2^.List^.Items[Index2].SessionId then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        4: begin
          if Data1^.List^.Items[Index1].ProcessId >
            Data2^.List^.Items[Index2].ProcessId then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].ProcessId =
            Data2^.List^.Items[Index2].ProcessId then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        5: begin
          Result := CompareText(Data1^.List^.Items[Index1].ProcessName,
            Data2^.List^.Items[Index2].ProcessName);
        end;
        6: begin
          if Data1^.List^.Items[Index1].ProcessAge >
            Data2^.List^.Items[Index2].ProcessAge then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].ProcessAge =
            Data2^.List^.Items[Index2].ProcessAge then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        7: begin
          Result := CompareText(Data1^.List^.Items[Index1].ProcessCPUTime,
            Data2^.List^.Items[Index2].ProcessCPUTime);
        end;
        8: begin
          if Data1^.List^.Items[Index1].ProcessMemUsage >
            Data2^.List^.Items[Index2].ProcessMemUsage then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].ProcessMemUsage =
            Data2^.List^.Items[Index2].ProcessMemUsage then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
        9: begin
          if Data1^.List^.Items[Index1].ProcessVMSize >
            Data2^.List^.Items[Index2].ProcessVMSize then
          begin
            Result := 1;
          end
          else if Data1^.List^.Items[Index1].ProcessVMSize =
            Data2^.List^.Items[Index2].ProcessVMSize then
          begin
            Result := 0;
          end
          else begin
            Result := -1;
          end;
        end;
      end;
    end
    else begin
      // We have no data, so return equal, should not occur!
      Result := 0;
    end;
  end;
end;

procedure TMainForm.VSTProcessGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var pData: PProcessNodeData;
  Username: string;
  IsConsole: Boolean;
begin
  pData := Sender.GetNodeData(Node);

  // Do we have data for this session?
  if pData^.List^.Count > pData^.Index then
  begin
    Username := pData^.List^.Items[pData^.Index].Username;
    IsConsole := pData^.List^.Items[pData^.Index].WinStationName = 'Console';

    if Kind in [ikNormal, ikSelected] then begin
      case column of
        0: ImageIndex := Integer(icServer);
        1: begin
          if Username = '' then
          begin
            ImageIndex := -1; // No Icon!
          end
          else if username = 'SYSTEM' then
          begin
            ImageIndex := Integer(icSystem);
          end
          else if username = 'LOCAL SERVICE' then
          begin
            ImageIndex := Integer(icService);
          end
          else if username = 'NETWORK SERVICE' then
          begin
            ImageIndex := Integer(icNetworkService);
          end
          else begin
            ImageIndex := Integer(icUser);
          end;
          end;
          2: begin
          if IsConsole then
          begin
            ImageIndex := Integer(icComputer);
          end
          else begin
            ImageIndex := Integer(icNetwork);
          end;
        end;
        5: ImageIndex := Integer(icProcess);
  //      6: ImageIndex := Integer(icClock);
        7: ImageIndex := Integer(icCPUTime);
        8: ImageIndex := Integer(icMemory);
  //      9: ImageIndex := Integer(icVirtual);
      end;
    end;
  end;
end;

procedure TMainForm.VSTProcessGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TProcessNodeData);
end;

procedure TMainForm.VSTProcessGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var pData: PProcessNodeData;
  FormatSettings: TFormatSettings;
begin
  // Get LocaleFormatSettings, we use them later on to format DWORD
  // values with bytes as KByte values with thousand seperators a la taskmgr
  // (we query this every time because the user may have changed settings)
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, FormatSettings);
  pData := Sender.GetNodeData(Node);

  // Do we have data for this session?
  if pData^.List^.Count > pData^.Index then
  begin
    case Column of
      0: CellText := pData^.List^.Items[pData^.Index].Owner.Owner.Server;
      1: CellText := pData^.List^.Items[pData^.Index].Username;
      2: CellText := pData^.List^.Items[pData^.Index].WinStationName;
      3: CellText := IntToStr(pData^.List^.Items[pData^.Index].SessionId);
      4: CellText := IntToStr(pData^.List^.Items[pData^.Index].ProcessId);
      5: CellText := pData^.List^.Items[pData^.Index].ProcessName;
      6: CellText := pData^.List^.Items[pData^.Index].ProcessAgeStr;
      7: CellText := pData^.List^.Items[pData^.Index].ProcessCPUTime;
      8: CellText := Format('%.0n K', [
        pData^.List^.Items[pData^.Index].ProcessMemUsage / 1024], FormatSettings);
      9: CellText := Format('%.0n K', [
        pData^.List^.Items[pData^.Index].ProcessVMSize / 1024], FormatSettings);
    end;
  end;
end;

procedure TMainForm.VSTServerChecked(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var pServerData: PServerNodeData;
  pUserNode: PVirtualNode;
  pUserData: PUserNodeData;
  pSessionNode: PVirtualNode;
  pSessionData: PSessionNodeData;
  i: Integer;
  pProcessNode: PVirtualNode;
  pProcessData: PProcessNodeData;
  PrevCount: Integer;
begin
  // Get the Node Data
  pServerData := Sender.GetNodeData(Node);
  if Node^.CheckState = csUncheckedNormal then
  begin
    if pServerData^.PTerminalServerList <> nil then
    begin
      with pServerData^.PTerminalServerList.Items[pServerData^.Index] do
      begin
        PrevCount := Sessions.Count;
        Sessions.Clear;
        UpdateVirtualTree(VSTUser, @Sessions, PrevCount);
        UpdateVirtualTree(VSTSession, @Sessions, PrevCount);
        PrevCount := Processes.Count;
        Processes.Clear;
        UpdateVirtualTree(VSTProcess, @Processes, PrevCount);
      end;
    end;
  end
  else if Node^.CheckState = csCheckedNormal then
  begin
    // Is this a server node?
    if pServerData^.Index > -2 then
    begin
      // Is a Terminal Server instance assigned?
      if pServerData^.PTerminalServerList = nil then
      begin
        // Create a Terminal Server instance
        pServerData^.Index := TerminalServers.Add(TjwTerminalServer.Create);
        // Set the servername
        TerminalServers[pServerData^.Index].Server := pServerData^.Caption;
        // Point the node data to a Terminal Server instance
        pServerData^.PTerminalServerList := @TerminalServers;
      end;

      with pServerData^.PTerminalServerList^[pServerData^.Index] do
      begin
        // EnumerateSessions
        if EnumerateSessions then
        begin
          for i := 0 to Sessions.Count - 1 do
          begin
            // Create a node for the session in the Users VST
            pUserNode := VSTUser.AddChild(nil);
            // and add the data
            pUserData := VSTUser.GetNodeData(pUserNode);
            // Set the Index
            pUserData^.Index := i;
            // Point to TerminalServerList.TerminalServer[Index].SessionList
            pUserData^.List := @Sessions;

            // Create a node for the session in the Sessions VST
            pSessionNode := VSTSession.AddChild(nil);
            // and add the data
            pSessionData := VSTSession.GetNodeData(pSessionNode);
            // Set the Index
            pSessionData^.Index := i;
            // Point to TerminalServerList.TerminalServer[Index].SessionList
            pSessionData^.List := @Sessions;
          end;
        end;

        // Assign Session Event Handler
        OnSessionEvent := OnTerminalServerEvent;
        if EnumerateProcesses then
        begin
          for i := 0 to Processes.Count - 1 do
          begin
            // Create a node for the session
            pProcessNode := VSTProcess.AddChild(nil);
            // and add the data
            pProcessData := VSTProcess.GetNodeData(pProcessNode);
            // Set the Index
            pProcessData^.Index := i;
            // Point to TerminalServerList.TerminalServer[Index].SessionList
            pProcessData^.List := @Processes;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMainForm.VSTServerCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  s2: string;
  s1: string;
begin
  s1 := PServerNodeData(Sender.GetNodeData(Node1))^.Caption;
  s2 := PServerNodeData(Sender.GetNodeData(Node2))^.Caption;
  Result := CompareText(s1, s2); 
end;

{procedure TMainForm.VSTServerDblClick(Sender: TObject);
begin
  if VSTServer.FocusedNode = pAllListedServersNode then
  begin
    ShowMessage('ok');
  end;
end;}

procedure TMainForm.VSTServerFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var pData: PServerNodeData;
begin
  pData := Sender.GetNodeData(Node);
  // Free the string data by setting it to ''
  pData^.Caption := '';
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
//  VSTServer.Header.SaveToStream();
  // Prevent updates to the Virtual String Grids
  VSTUser.OnGetText := nil;
  VSTServer.OnGetText := nil;

  // Now Free the Terminal Server Instances
  TerminalServers.Free;
end;

end.
