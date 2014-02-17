FactoryGirl.define do 
	factory :user do
		name   "Shinsuke Moriguchi"
		email  "musicomusio@biglobe.jp"
		password "foobar"
		password_confirmation "foobar"
	end
end