# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rspec-its` gem.
# Please instead update this file by running `bin/tapioca gem rspec-its`.

# source://rspec-its//lib/rspec/its/version.rb#1
module RSpec
  class << self
    # source://rspec-core/3.13.0/lib/rspec/core.rb#70
    def clear_examples; end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#85
    def configuration; end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#49
    def configuration=(_arg0); end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#97
    def configure; end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#194
    def const_missing(name); end

    # source://rspec-core/3.13.0/lib/rspec/core/dsl.rb#42
    def context(*args, &example_group_block); end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#122
    def current_example; end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#128
    def current_example=(example); end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#154
    def current_scope; end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#134
    def current_scope=(scope); end

    # source://rspec-core/3.13.0/lib/rspec/core/dsl.rb#42
    def describe(*args, &example_group_block); end

    # source://rspec-core/3.13.0/lib/rspec/core/dsl.rb#42
    def example_group(*args, &example_group_block); end

    # source://rspec-core/3.13.0/lib/rspec/core/dsl.rb#42
    def fcontext(*args, &example_group_block); end

    # source://rspec-core/3.13.0/lib/rspec/core/dsl.rb#42
    def fdescribe(*args, &example_group_block); end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#58
    def reset; end

    # source://rspec-core/3.13.0/lib/rspec/core/shared_example_group.rb#110
    def shared_context(name, *args, &block); end

    # source://rspec-core/3.13.0/lib/rspec/core/shared_example_group.rb#110
    def shared_examples(name, *args, &block); end

    # source://rspec-core/3.13.0/lib/rspec/core/shared_example_group.rb#110
    def shared_examples_for(name, *args, &block); end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#160
    def world; end

    # source://rspec-core/3.13.0/lib/rspec/core.rb#49
    def world=(_arg0); end

    # source://rspec-core/3.13.0/lib/rspec/core/dsl.rb#42
    def xcontext(*args, &example_group_block); end

    # source://rspec-core/3.13.0/lib/rspec/core/dsl.rb#42
    def xdescribe(*args, &example_group_block); end
  end
end

module RSpec::Core::SharedContext
  include ::RSpec::Its
end

# source://rspec-its//lib/rspec/its/version.rb#2
module RSpec::Its
  # Creates a nested example group named by the submitted `attribute`,
  # and then generates an example using the submitted block.
  #
  # The attribute can be a `Symbol` or a `String`. Given a `String`
  # with dots, the result is as though you concatenated that `String`
  # onto the subject in an expression.
  #
  # When the subject is a `Hash`, you can refer to the Hash keys by
  # specifying a `Symbol` or `String` in an array.
  #
  # With an implicit subject, `is_expected` can be used as an alternative
  # to `should` (e.g. for one-liner use). An `are_expected` alias is also
  # supplied.
  #
  # With an implicit subject, `will` can be used as an alternative
  # to `expect { subject.attribute }.to matcher` (e.g. for one-liner use).
  #
  # With an implicit subject, `will_not` can be used as an alternative
  # to `expect { subject.attribute }.to_not matcher` (e.g. for one-liner use).
  #
  # You can pass more than one argument on the `its` block to add
  # some metadata to the generated example
  #
  # Note that this method does not modify `subject` in any way, so if you
  # refer to `subject` in `let` or `before` blocks, you're still
  # referring to the outer subject.
  #
  # @example
  #
  #   describe Person do
  #   subject { Person.new }
  #   before { subject.age = 25 }
  #   its(:age) { should eq(25) }
  #   end
  # @example
  #
  #   describe Person do
  #   subject do
  #   Person.new.tap do |person|
  #   person.phone_numbers << "555-1212"
  #   end
  #   end
  #
  #   its("phone_numbers.first") { should eq("555-1212") }
  #   end
  # @example
  #
  #   describe "a configuration Hash" do
  #   subject do
  #   { :max_users => 3,
  #   'admin' => :all_permissions.
  #   'john_doe' => {:permissions => [:read, :write]}}
  #   end
  #
  #   its([:max_users]) { should eq(3) }
  #   its(['admin']) { should eq(:all_permissions) }
  #   its(['john_doe', :permissions]) { should eq([:read, :write]) }
  #
  #   # You can still access its regular methods this way:
  #   its(:keys) { should include(:max_users) }
  #   its(:count) { should eq(2) }
  #   end
  # @example
  #
  #   describe Array do
  #   its(:size) { is_expected.to eq(0) }
  #   end
  # @example
  #
  #   describe Array do
  #   its(:foo) { will raise_error(NoMethodError) }
  #   end
  # @example
  #
  #   describe Array do
  #   its(:size) { will_not raise_error }
  #   end
  # @example
  #
  #   # This ...
  #   describe Array do
  #   its(:size, :focus) { should eq(0) }
  #   end
  #
  #   # ... generates the same runtime structure as this:
  #   describe Array do
  #   describe "size" do
  #   it "should eq(0)", :focus do
  #   subject.size.should eq(0)
  #   end
  #   end
  #   end
  # @example
  #
  #   # This ...
  #   describe Array do
  #   its(:size) { should eq(0) }
  #   end
  #
  #   # ... generates the same runtime structure as this:
  #   describe Array do
  #   describe "size" do
  #   it "should eq(0)" do
  #   subject.size.should eq(0)
  #   end
  #   end
  #   end
  #
  # source://rspec-its//lib/rspec/its.rb#121
  def its(attribute, *options, &block); end
end

# source://rspec-its//lib/rspec/its/version.rb#3
RSpec::Its::VERSION = T.let(T.unsafe(nil), String)
