require 'spec_helper'

describe "Static Pages" do

    subject{ page }

    shared_examples_for "all static pages" do
      it {should have_content(heading)}
      it {should have_title(full_title(page_title))}
    end

    # it "should have the right links on the layout" do
    #   visit root_path
    #   click_link "About"
    #   expect(page).to have_title(full_title('About Us'))
    #   click_link "Help"
    #   expect(page).to 
    #   click_link "Contat"
    #   expect(page).to
    #   click_link "Home"
    #   click_link "Sign up now!"
    #   expect(page).to 
    #   click_link "sample app"
    #   expect(page).to 
    # end
    
    describe "Home page" do
    before { visit root_path }
    let(:heading) {'Sample App'}
    let(:page_title) {''}

    it_should_behave_like "all static pages"
    it { should_not have_title( '| Home')}

  end


  describe "Help page" do

    before { visit help_path }
    
    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }

 end

  describe "About page" do
  
 
    before { visit about_path }
    
    it { should have_content('About') }
    it { should have_title(full_title('About Us')) } 


  end

  describe "Contact page" do

    before { visit contact_path }
    
    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) } 

  end

  describe "for signed_in users" do
    let(:user) { FactoryGirl.create(:user) }
    before do
        FactoryGirl.create(:micropost,user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost,user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
    end

    it "shoud render thear user's feed" do
        user.feed.each do |item|
            expect(page).to have_selector("li##{item.id}", text: item.content)
        end
        
    end
  end
end
