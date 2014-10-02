class Song

  attr_reader :title, :author
  attr_writer :title, :author

  def initialize(title, author, audio)
    @title = title
    @author = author
    @audio = audio
  end

  def play
    `say #{@audio}`
  end

end