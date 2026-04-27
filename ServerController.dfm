object IWServerController: TIWServerController
  AppName = 'DVIW'
  Description = 'DateView database'
  DisplayName = 'DateView database'
  Port = 8085
  URLBase = '/DateView/'
  Version = '16.1.8'
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
end
