import paramiko

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ipAddress = '169.254.150.45'

client.connect(ipAddress, username='robot', password='maker')

# filedelete = 'pybricks-micropython ~/test2/main.py'
command = 'pybricks-micropython ~/emobot_movement/sad.py'


# stdin, stdout, stderr = client.exec_command(filedelete)  # Non-blocking call
stdin, stdout, stderr = client.exec_command(command)  # Non-blocking call
channel = stdout.channel
exit_status = channel.recv_exit_status()
# exit_status = stdout.channel.recv_exit_status()          # Blocking call
if exit_status == 0:
    print ("File Deleted")
else:
    print("Error", exit_status)
client.close()