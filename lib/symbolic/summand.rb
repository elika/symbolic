require_relative 'summands'
module Symbolic
  class Summand < Abelian
    OPERATION = :+
    IDENTITY = 0
    GROUP = Symbolic::Summands
    
    def value
      @coef + @base * @exp
    end
    
    def -@
      @numeric  *= -1
      @symbolic *= -1
      self
    end
    
    def +(o)
      group << o # Summands.new(self, o)
    end
    
    def -(o)
      @symbolic = Summand.new(@symbolic, -o)
      self
    end
    
    def *(o)
      Factor.new(o, self)
    end
    
    def **(o)
      Factor.new(1, self) ** o
    end
  end
end