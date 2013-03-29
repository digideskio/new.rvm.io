require "pathname"

module RVM
  module Helpers
    module Examples
      EXAMPLE_ROOT = Pathname.new(
        File.expand_path("../../../examples", __FILE__))

      def use_example(example)
        "<pre>#{EXAMPLE_ROOT.join(example.to_s + ".txt").read}</pre>"
      end
    end
  end
end
