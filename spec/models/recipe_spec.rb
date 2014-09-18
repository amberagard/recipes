require 'spec_helper'

describe Recipe do
  before do
    @recipe = Recipe.new(name: "Cake")
  end

  subject { @recipe }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @recipe.name= nil }
    it { should_not be_valid }
  end

end
