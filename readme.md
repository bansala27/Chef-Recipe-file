Using Chef a configuration management tool to create a new recipe that contains the automated Ruby code that creates a new file in the local or remote Chef workstation.

You can make your own Linux machine a Chef workstation or use an AWS EC2 instance.

I will be using an AWS EC2 instance.

Steps to achieve it:

1. Create a Linux(Red Hat, Ubuntu, Amazon Linux) machine on an AWS EC2 instance
2. Connect your local machine with the AWS EC2 instance
3. Windows users can use Putty to make a connection whereas Mac OS or Linux users can simply SSH into your EC2 instance
4. Now install Chef on your virtual Linux machine using Wget
5. Create a directory with a default name cookbooks: mkdir cookbooks
6. cd cookbooks
7. Now create a cookbook: chef generate cookbook test-cookbook
8. cd test-cookbook
9. Now create a recipe in test-cookbook: chef generate recipe test-recipe
10. cd ..
11. Now let's write a ruby code in our recipe that will create a file
12. vi test-cookbook/recipes/test-recipe.rb
13. Code:
14. file '/myFile' do
15. content 'Welcome to my chef repository'
16. action :create
17. end
18. Press Escape, type :wq and hit enter
19. Now check if the code written has no errors chef exec ruby -c test-cookbook/recipes/test-recipe.rb
20. Now it is time to call Chef-Client that will run the recipe and make updates accordingly chef-client -zr "recipe[test-cookbook::test-recipe]"
After running this command a file will be created in the root directory
Now go to the root directory and enter ls and then enter cat myFile
myFile will be there with the message Welcome to my chef repository
