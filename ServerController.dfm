object IWServerController: TIWServerController
  AppName = 'DateView'
  Description = 'DateView'
  DisplayName = 'DateView'
  Port = 8085
  SSLOptions.SSLVersion = SSLv3
  URLBase = '/dateview/'
  Version = '16.1.5'
  ExceptionLogger.Enabled = True
  HttpKeepAlive = True
  SessionOptions.LockSessionTimeout = 60000
  SessionOptions.LogSessionEvents = [etCreate, etDestroy, etRequest]
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  OnBrowserCheck = IWServerControllerBaseBrowserCheck
  Height = 310
  Width = 342
end
