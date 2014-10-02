class Song

  def initialize(title, author, audio)
    @title = title
    @author = author
    @audio = audio
  end

  def title
    return @title
  end

  def author
    return @author
  end

  def play
    `say #{@audio}`
  end

end