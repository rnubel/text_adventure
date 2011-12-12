module Command

end

class Command::Look
  def init(target=nil)
    @target = target
  end
end
