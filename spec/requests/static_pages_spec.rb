require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before(:each)    { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }

    it "should have the right links" do
      click_link "Sign up now!"
      should have_title(full_title('Sign up'))
    end
  end

  describe "Help page" do
    before(:each)    { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    
    it_should_behave_like "all static pages"
  end
  
  describe "About page" do
    before(:each)    { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { 'About Us' }
 
    it_should_behave_like "all static pages" 
  end
  
  describe "Contact page" do
    before(:each)    { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
  
    it_should_behave_like "all static pages"
  end

  describe "Header" do
    it "should have the right links" do
      visit root_path

      click_link "sample app"
      expect(page).to have_title(full_title(''))
      click_link "Home"
      expect(page).to have_title(full_title(''))
      click_link "Help"
      expect(page).to have_title(full_title('Help'))
      #click_link "Sign in"
      #expect(page).to have_title(full_title('Sign in'))
    end
  end

  describe "Footer" do
    it "should have the right links" do
      visit root_path

      click_link "About"
      expect(page).to have_title(full_title('About Us'))
      click_link "Contact"
      expect(page).to have_title(full_title('Contact'))
      #click_link "News"
      #expect(page).to have_title(full_title('News'))
    end
  end
end
