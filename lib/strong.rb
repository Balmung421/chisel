class Strong

  attr_accessor :sub_counter

  def initialize(text)
    @text = text
    @sub_counter = 0
  end

  def call
    if @text.include?("**")
      render_strong_tags
    else
      @text
    end
  end

  def render_strong_tags
    counter = 0
    while counter <= @text.length
      if self.sub_counter.even?
        sub_first
      else
        sub_second
      end
      counter += 1
    end
    @text
  end

  def sub_first
    @text.sub!("**", "<strong>") && self.sub_counter += 1
  end

  def sub_second
    @text.sub!("**", "</strong>") && self.sub_counter += 1
  end
end
