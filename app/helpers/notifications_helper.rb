module NotificationsHelper
  def posted_time(time)
    time > Date.today ? "#{time_ago_in_words(time)}前" : time.strftime('%m月%d日')
  end
end
