class Action

  attr_reader :topic, :time, :text

  def initialize(topic, time, text)
    @topic = topic
    @time = time
    @text = text
  end

end
