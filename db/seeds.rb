# encoding: utf-8
Product.delete_all
Cart.delete_all
Order.delete_all
LineItem.delete_all
Catalog.delete_all
User.delete_all

Product.create(:title => 'Web Design for Developers',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :image_url =>   '/images/wd4d.jpg',    
  :price => 42.95,
  :catalog => "C++")
# . . .
Product.create(:title => 'Programming Ruby 1.9',
  :description =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  :image_url => '/images/ruby.jpg',
  :price => 49.50,
  :catalog => "C++")
# . . .

Product.create(:title => 'Rails Test Prescriptions',
  :description => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :image_url => '/images/rtp.jpg',
  :price => 43.75,
  :catalog => "C++")

User.create(:name => 'dave', :password => 'secret', :password_confirmation => 'secret', :role => 0)


Catalog.create(:name => "Programming", :pid => "root")
Catalog.create(:name => "Mathematics", :pid => "root")

Catalog.create(:name => "C++",         :pid => "Programming")
Catalog.create(:name => "C",           :pid => "Programming")

Catalog.create(:name => "Linear Algebra",       :pid => "Mathematics")
Catalog.create(:name => "Discrete Mathematics", :pid => "Mathematics")

Catalog.create(:name => "API",         :pid => "C++")
Catalog.create(:name => "OOAD",        :pid => "C++")

Catalog.create(:name => "Matrix",       :pid => "Linear Algebra")
Catalog.create(:name => "Vector",       :pid => "Linear Algebra")

