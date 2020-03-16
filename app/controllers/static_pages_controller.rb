class StaticPagesController < ApplicationController

  def index
    @nome = "Cleiton Ivan Gregory"
  end

  def sobre
    @sobre = "Project Base"
  end

  def contato
    @contato = "@karnicagregory"
  end

end
