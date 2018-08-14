require 'rails_helper'

RSpec.describe Skill, as: :model do
  it 'cannot be created without a name' do
    skill = Skill.create

    expect(Skill.all.size).to eq 0
  end

  it 'has a unique name' do
    Skill.create :name => "Skill"
    Skill.create :name => "Skill"

    expect(Skill.all.size).to eq 1
  end

  it 'will save when it has a name' do
    Skill.create :name => "Skill"

    expect(Skill.all.size).to eq 1
  end

end