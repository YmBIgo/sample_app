require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'
include Capybara::DSL

describe "Static pages" do

  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  subject { page }

  shared_examples_for "all static pages" do
    it {should have_content(heading)}
    it {should have_title(full_title(page_title))}
  end

  describe "Home page" do
    before { visit root_path }

    # it { should have_content('Sample App') }
    # it { should have_title(full_title('')) }
    let(:heading)         { 'Sample App' }
    let(:page_title)      { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home')}

  end

  describe "Help pages" do
    before {visit help_path}

    let(:heading)         { 'Help' }
    let(:page_title)      { 'Help' }
  end

  describe "About Page" do
    before {visit about_path}

    let(:heading)         { 'About' }
    let(:page_title)      { 'About Us' }
  end

  describe "Contact Page" do
    before {visit contact_path}

    let(:heading)         { 'Contact' }
    let(:page_title)      { 'Contact' }
  end
end
