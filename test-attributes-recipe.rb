# In this recipe I will create attributes so that if there are 100 nodes and I want their information, then I can simply run a recipe using chef-client and get their details.

file '/getInfo' do  #this will create a getInfo in my root directory
content " I want to fetch the following information from my nodes

HOSTNAME: ${node['hostname']}  #this will display the hostanme of that node

IPADDRESS: ${node['ipaddress']}  #this will display the ipaddress of that node

MEMORY: ${node['memory'] ['total']}  #this will display the total memory of that node

CPU: ${node['cpu']['0' ['mhz']]}"  #this will display the CPU usage of that node

action :create
end 
