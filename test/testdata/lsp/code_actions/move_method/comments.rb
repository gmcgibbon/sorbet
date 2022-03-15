# typed: strict
# selective-apply-code-action: refactor.extract
#
# Test asserts comments between a sig and a method def are not moved,
# because we cut out only a signature and a method body without touching anything in between

class Foo
  extend T::Sig

sig {void}
# comment between sig and def should stay in place
def bar; end
   # ^ apply-code-action: [A] Move method to a new module

sig do
  void
end # comment after sig should stay in place
def baz; end
# ^ apply-code-action: [B] Move method to a new module

sig do
  void
end


def qux
# ^ apply-code-action: [C] Move method to a new module
end
end