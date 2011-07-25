# default output db format yyyy-mm-dd hh:mm:ss
Time::DATE_FORMATS.merge!(
  :default => Time::DATE_FORMATS[:db]
)