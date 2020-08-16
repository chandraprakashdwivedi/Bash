# from netmiko import ConnectHandler
# from getpass import getpass

class PythonSwitchStatement:

    def switch(self, val):
        default = "Invalid entry"
        return getattr(self, 'case_' + str(val), lambda: default)()
    def case_1(self):
        connection(self)
    def case_1(self):
        delete_realservers_IP(self)
    def case_1(self):
        add_realservers_IP(self)
    def case_1(self):
        create_virtual_server(self)
    def case_1(self):


# def switch(val):
#         switcher={
#                 1:  connection(),
#                 2:  delete_realservers_IP(),
#                 3:  add_realservers_IP(),
#                 4:  create_virtual_server()
#             }.get(val, "Invalid data")
          

def connection(self):
    # fortigate = {
    #     "device_type": "fortinet",
    #     "host": "10.91.144.62",
    #     "username": "admin",
    #     "password": "admin",
    # }

    # cfg_file = "config_changes.txt"
    # with ConnectHandler(**fortigate) as net_connect:
    #     output = net_connect.send_config_from_file(health_check_command)
    #     output.center(10,"*")
    #     #print("Running command " + output)
    #     #output += net_connect.save_config()
    # def cleaned(output):
    #         for line in output:
    #                 yield line.replace(" ", "")
    # #print()
    # #print(output)
    
    fortIP= input("enter IP: ")
    print(fortIP)
    


# def delete_realservers_IP(self):

# def add_realservers_IP(self):


# def create_virtual_server(self):


if __name__ == "__main__":

    option1="Create a Health Check Monitor."
    option2="Create a Virtual Server."
    option3="Add or Delete realservers IP Address."
    cmd_p="************"
    USER = input("Please enter your name: ")


    print("\n",cmd_p)
    print("\nExecuting command")
    print("\n",cmd_p)

    print("***  Welcome, {}  *** ' \n This Utility is designed to perform Fortigate Firewall Configuration. \n Let's proceed by choosing one of the below given options..." .format(USER))



    print("**< MENU >*** \n")
    val=input(" Please enter 1 to 3  and 4 is to exit \n")
    #print("Redirecting To {}  menu... \n" .format(val))
    #switch(val)
    s = PythonSwitchStatement()
    s.switch(val)
    

