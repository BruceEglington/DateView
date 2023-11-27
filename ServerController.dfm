object IWServerController: TIWServerController
  AppName = 'DateView'
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'DateView'
  DisplayName = 'DateView'
  Log = loFile
  Port = 8085
  SSLOptions.SSLVersion = SSLv3
  Version = '15.5.0'
  ExceptionLogger.Enabled = True
  SessionOptions.LogSessionEvents = [etCreate, etDestroy, etRequest]
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  Height = 310
  Width = 342
end
