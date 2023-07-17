Using Chef a configuration management tool to create a new recipe that contains the automated Ruby code that creates a new file in the local or remote Chef workstation.

You can make your own Linux machine a Chef workstation or use an AWS EC2 instance.

I will be using an AWS EC2 instance.

Steps to achieve it:

Create a Linux(Red Hat, Ubuntu, Amazon Linux) machine on an AWS EC2 instance
Connect your local machine with the AWS EC2 instance
Windows users can use Putty to make a connection whereas Mac OS or Linux users can simply SSH into your EC2 instance
Now install Chef on your virtual Linux machine using Wget
Create a directory with a default name cookbooks: mkdir cookbooks
cd cookbooks
Now create a cookbook: chef generate cookbook test-cookbook
cd test-cookbook
Now create a recipe in test-cookbook: chef generate recipe test-recipe
cd ..
Now let's write a ruby code in our recipe that will create a file
vi test-cookbook/recipes/test-recipe.rb
Code:
file '/myFile' do
content 'Welcome to my chef repository'
action :create
end
Press Escape, type :wq and hit enter
Now check if the code written has no errors chef exec ruby -c test-cookbook/recipes/test-recipe.rb
Now it is time to call Chef-Client that will run the recipe and make updates accordingly chef-client -zr "recipe[test-cookbook::test-recipe]"
After running this command a file will be created in the root directory
Now go to the root directory and enter ls and then enter cat myFile
myFile will be there with the message Welcome to my chef repository
