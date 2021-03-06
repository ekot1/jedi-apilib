program JEDIcomp;

{$APPTYPE CONSOLE}

uses
  JwaAccCtrl,
  JwaAclApi,
  JwaAclUI,
  JwaActiveDS,
  JwaActiveX,
  JwaAdsDb,
  JwaAdsErr,
  JwaAdsHlp,
  JwaAdsnms,
  JwaAdsProp,
  JwaAdssts,
  JwaAdsTLB,
  JwaAdtGen,
  JwaAF_Irda,
  JwaAppRecovery,
  JwaAtalkWsh,
  JwaAuthif,
  JwaAuthz,
  JwaBatClass,
  JwaBCrypt,
  JwaBitFields,
  JwaBits,
  JwaBits1_5,
  JwaBits2_0,
  JwaBits2_5,
  JwaBits3_0,
  JwaBitscfg,
  JwaBitsMsg,
  JwaBLBErr,
  JwaBluetoothAPIs,
  JwaBtHDef,
  JwaBthSdpDef,
  JwaBugCodes,
  JwaCardErr,
  JwaCdErr,
  JwaCmnQuery,
  JwaColorDlg,
  JwaCOMSecurity,
  JwaCpl,
  JwaCplext,
  JwaCryptUIApi,
  JwaDbt,
  JwaDde,
  JwaDhcpCSdk,
  JwaDhcpsApi,
  JwaDhcpSSdk,
  JwaDlgs,
  JwaDSAdmin,
  JwaDSClient,
  JwaDSGetDc,
  JwaDskQuota,
  JwaDSQuery,
  JwaDSRole,
  JwaDsSec,
  JwaDwmapi,
  JwaErrorRep,
  JwaEventDefs,
  JwaEventTracing,
  JwaEvntCons,
  JwaEvntProv,
  JwaExcpt,
  JwaFaxDev,
  JwaFaxExt,
  JwaFaxMmc,
  JwaFaxRoute,
  JwaGPEdit,
  JwaHhError,
  JwaHtmlGuid,
  JwaHtmlHelp,
  JwaIAccess,
  JwaIAdmExt,
  JwaIcmpApi,
  JwaIisCnfg,
  JwaImageHlp,
  JwaImapi,
  JwaImapiError,
  JwaIme,
  JwaIoEvent,
  JwaIpExport,
  JwaIpHlpApi,
  JwaIpIfCons,
  JwaIpInfoId,
  JwaIpRtrMib,
  JwaIpTypes,
  JwaIsGuids,
  JwaIssPer16,
  JwaLM,
  JwaLmAccess,
  JwaLmAlert,
  JwaLmApiBuf,
  JwaLmAt,
  JwaLmAudit,
  JwaLmConfig,
  JwaLmCons,
  JwaLmDFS,
  JwaLmErr,
  JwaLmErrLog,
  JwaLmJoin,
  JwaLmMsg,
  JwaLmRemUtl,
  JwaLmRepl,
  JwaLmServer,
  JwaLmShare,
  JwaLmSName,
  JwaLmStats,
  JwaLmSvc,
  JwaLmUse,
  JwaLmUseFlg,
  JwaLmWkSta,
  JwaLoadPerf,
  JwaLpmApi,
  JwaMciAvi,
  JwaMprError,
  JwaMsi,
  JwaMsiDefs,
  JwaMsiQuery,
  JwaMsTask,
  JwaMSTcpIP,
  JwaMSWSock,
  JwaNative,
  JwaNb30,
  JwaNCrypt,
  JwaNetSh,
  JwaNspApi,
  JwaNtDdPar,
  JwaNtDsApi,
  JwaNtDsbCli,
  JwaNtDsBMsg,
  JwaNtLDAP,
  JwaNtQuery,
  JwaNtSecApi,
  JwaNtStatus,
  JwaObjSel,
  JwaPatchApi,
  JwaPatchWiz,
  JwaPbt,
  JwaPdh,
  JwaPdhMsg,
  JwaPowrProf,
  JwaProfInfo,
  JwaProtocol,
  JwaPrSht,
  JwaPsApi,
  JwaQos,
  JwaQosName,
  JwaQosPol,
  JwaQosSp,
  JwaReason,
  JwaRegStr,
  JwaRpc,
  JwaRpcASync,
  JwaRpcDce,
  JwaRpcNsi,
  JwaRpcNtErr,
  JwaRpcSsl,
  JwaRpcWinsta,
  JwaSceSvc,
  JwaSchedule,
  JwaSchemaDef,
  JwaSddl,
  JwaSecExt,
  JwaSecurity,
  JwaSens,
  JwaSensAPI,
  JwaSensEvts,
  JwaSfc,
  JwaShAppMgr,
  JwaShellAPI,
  JwaSHFolder,
  JwaShlDisp,
  JwaShlGuid,
  JwaShlObj,
  JwaShLWAPI,
  JwaSisBkUp,
  JwaSnmp,
  JwaSoftpub,
  JwaSpOrder,
  JwaSrRestorePtApi,
  JwaSspi,
  JwaStrSafe,
  JwaSubAuth,
  JwaSvcGuid,
  JwaTlHelp32,
  JwaTmSchema,
  JwaTraffic,
  JwaUrlHist,
  JwaUrlMon,
  JwaUserEnv,
  JwaUxTheme,
  JwaVista,
  JwaWabApi,
  JwaWabCode,
  JwaWabDefs,
  JwaWabIab,
  JwaWabMem,
  JwaWabNot,
  JwaWabTags,
  JwaWabUtil,
  JwaWbemCli,
  JwaWdm,
  JwaWinAble,
  JwaWinBase,
  JwaWinBer,
  JwaWinCon,
  JwaWinCpl,
  JwaWinCred,
  JwaWinCrypt,
  JwaWinDLLNames,
  JwaWinDNS,
  JwaWinEFS,
  JwaWinError,
  JwaWinFax,
  JwaWinGDI,
  JwaWinInet,
  JwaWinIoctl,
  JwaWinLDAP,
  JwaWinNetWk,
  JwaWinNLS,
  JwaWinNT,
  JwaWinPerf,
  JwaWinReg,
  JwaWinResrc,
  JwaWinSafer,
  JwaWinSock,
  JwaWinsock2,
  JwaWinSta,
  JwaWinSvc,
  JwaWinternl,
  JwaWintrust,
  JwaWinType,
  JwaWinUser,
  JwaWinVer,
  JwaWinWlx,
  JwaWmiStr,
  JwaWowNT16,
  JwaWowNT32,
  JwaWPApi,
  JwaWPApiMsg,
  JwaWPCrsMsg,
  JwaWPFtpMsg,
  JwaWPPstMsg,
  JwaWPSpiHlp,
  JwaWPTypes,
  JwaWPWizMsg,
  JwaWS2atm,
  JwaWs2Bth,
  JwaWS2dnet,
  JwaWS2spi,
  JwaWS2tcpip,
  JwaWShisotp,
  JwaWSipx,
  JwaWSnetbs,
  JwaWSNwLink,
  JwaWsrm,
  JwaWSvns,
  JwaWtsApi32,
  JwaZMOUSE,
  JwaWindows,
  D5impl,
  JwsclAccounts,
  JwsclAcl,
  JwsclAuthCtx,
  JwsclCertificates,
  JwsclComSecurity,
  JwsclComUtils,
  JwsclConstants,
  JwsclCredentials,
  JwsclCryptProvider,
  JwsclDescriptor,
  JwsclDesktops,
  JwsclElevation,
  JwsclEncryption,
  JwsclEnumerations,
//  JwsclEurekaLogUtils,  // Requires EurekaLog
  JwsclExceptions,
  JwsclFirewall,
  JwsclImpersonation,
  JwsclKnownSid,
  JwsclLogging,
  JwsclLsa,
  JwsclMapping,
//  JwsclPathSimulation,  // Delphi 2009 and newer
  JwsclPrivileges,
  JwsclProcess,
  JwsclResource,
  JwsclSecureObjects,
  JwsclSecurePrivateObjects,
  JwsclSecureUserObjects,
  JwsclSecurityDialogs,
  JwsclSid,
  JwsclSimpleDescriptor,
  JwsclStreams,
  JwsclStrings,
  JwsclTerminalServer,
  JwsclToken,
  JwsclTypes,
  JwsclUtils,
  JwsclVersion,
  JwsclWinStations,
  RpcWinsta;

begin
  { TODO -oUser -cConsole Main : Insert code here }
end.
