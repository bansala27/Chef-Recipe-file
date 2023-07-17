#code to create a new file in root direectory with data in it
file '/myFile' do
content 'Welcome to my chef repository'
action :create
end

#code to install tree package in Linux
package 'tree' do
action :install
end
